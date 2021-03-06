package com.furnifit.plan.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.furnifit.common.web.PageBuilder;
import com.furnifit.common.web.Params;
import com.furnifit.coupon.domain.Coupon;
import com.furnifit.coupon.service.CouponService;
import com.furnifit.member.domain.Member;
import com.furnifit.orders.domain.Orders;
import com.furnifit.plan.domain.Plan;
import com.furnifit.plan.service.PlanService;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.planitem.service.PlanItemService;


/**
 * PlanItemController 클래스
 * @author 손정화
 *
 */
@Controller
public class PlanController {

	private final int PAGE_SIZE = 10;  /** 페이지에 출력할 행의 수 */
	private final int PAGI_SIZE = 10;  /** 페이지에 출력할 페이지 수 (<< >> 생성)*/

	Logger logger = Logger.getLogger(PlanController.class);

	@Inject
	private PlanService planService;
	@Inject
	private PlanItemService itemService;
	@Inject
	private CouponService couponService;

	@Resource(name = "svgImgPath")
	private String svgImgPath;

	/** 배치도목록 리스트 */
	@RequestMapping(value = "/mypage/planlist", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request, Params params, Orders order) throws Exception {
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");

		// 페이징
		int totalRowCount = planService.pageCount();
		params.setPageSize(PAGE_SIZE);
		params.setPagiSize(PAGI_SIZE);

		List<Plan> size = planService.listAll(member.getEmail());
		List<Plan> planlist = planService.listByParams(params);
		logger.info("파람----"+size);
		PageBuilder pageBuilder = new PageBuilder(params, totalRowCount);
		pageBuilder.build();

		List<PlanItem> itemList = itemService.listAll();
		List<Coupon> couponList =  couponService.read(member.getEmail());
		//Coupon coupon = couponService.serialRead(order.getOrderId());

		//logger.info("coupon getId---"+coupon);
		model.addAttribute("title", "Furnifit - planList");
		model.addAttribute("planlist", planlist);
		model.addAttribute("pageBuilder", pageBuilder);
		model.addAttribute("itemlist", itemList);
		model.addAttribute("couponlist", couponList);
		model.addAttribute("planSize", size);
		
		return "plan/plan-manage";
	}


	/** 배치도 항목 삭제 */
	//	@RequestMapping(value = "/mypage/planlist/{planId}/{planitemId}", method = RequestMethod.DELETE)
	//	public String remove(@PathVariable("planId") int planId, @PathVariable("planitemId") int planitemId)throws Exception{
	//		itemService.delete(planId, planitemId);
	//		return "redirect:/plan/plan-manage";	
	//	}


	/**
	 * 배치도 작성 화면(김형주)
	 */
	@RequestMapping(value = "/plan/writer", method=RequestMethod.GET)
	public String writer() throws Exception {
		return "plan/writer";
	}

	/**
	 * 배치도 작성 처리(김형주)
	 */
	@RequestMapping(value = "/plan", method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody Plan plan, HttpSession session) throws Exception {
		logger.info("플랜이름 :"+plan.getName());

		ResponseEntity<String> entity = null;
		try {
			Member member= (Member) session.getAttribute("login");
			plan.setEmail(member.getEmail());
			planService.writePlan(plan);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 배치도 파일 저장 처리(김형주)
	 */
	@RequestMapping(value = "/plan/file", method=RequestMethod.POST)
	public ResponseEntity<String> save(@RequestBody PlanItem planitem) throws Exception {
		logger.info("플랜이름 :"+planitem.getName());
		//logger.info("플랜내용 :"+planitem.getImage());
		ResponseEntity<String> entity = null;
		try {
			String filePath = planService.saveFile(planitem);
			logger.info("파일이름 :"+filePath);
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			entity = new ResponseEntity<String>(filePath,responseHeaders,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 배치도 파일 다운로드 처리(김형주)
	 */
	@RequestMapping(value = "/plan/download")
	public void download(@RequestParam String filename, HttpServletResponse response) throws Exception {
		
		logger.info("파일이름 :"+filename);
		byte fileByte[] = FileUtils.readFileToByteArray(new File(svgImgPath+filename));
	     
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(filename,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}

}

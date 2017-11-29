package com.furnifit.plan.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/** 배치도목록 리스트 */
	@RequestMapping(value = "/mypage/planlist", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request, Params params, Orders order) throws Exception {
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		// 페이징
		int totalRowCount = planService.pageCount();
		params.setPageSize(PAGE_SIZE);
		params.setPagiSize(PAGI_SIZE);
		
		List<Plan> planlist = planService.listByParams(params);
		
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
	@ResponseBody
	public String regist(@RequestBody Map<String, Object> plan) throws Exception {
		logger.info("In regist()........");
		//logger.info(plan);
		
		List<Map<String, Object>> pitems= (List<Map<String, Object>>) plan.get("planitems");
		for (Map<String, Object> map : pitems) {
			logger.info(map);
		}
		
		
	/*	for (PlanItem planItem : planitems) {
			logger.info(planItem);
		}
*/
		
		return "plan/writer";
	}
	
	
	
}

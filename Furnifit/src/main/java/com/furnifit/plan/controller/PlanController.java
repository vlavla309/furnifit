package com.furnifit.plan.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.member.domain.Coupon;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.CouponService;
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
@RequestMapping("/mypage/planlist")
public class PlanController {
	
	Logger logger = Logger.getLogger(PlanController.class);
	
	@Inject
	private PlanService planService;
	@Inject
	private PlanItemService itemService;
	@Inject
	private CouponService couponService;
	
	/** 회원별 배치도목록 리스트 */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Plan> planlist = planService.listAll(member.getEmail());
		for (Plan plan : planlist) {
			logger.info(plan);
		}
		
		List<PlanItem> itemList = itemService.listAll();
		for (PlanItem planItem : itemList) {
			logger.info(planItem);
		}
		
		List<Coupon> couponList =  couponService.read(member.getEmail());
		
		model.addAttribute("planlist", planlist);
		model.addAttribute("itemlist", itemList);
		model.addAttribute("couponlist", couponList);
		
		return "plan/plan-manage";
	}

	
	/*@RequestMapping(value = "/{articleId}", method = RequestMethod.GET)
	public String read(@PathVariable int articleId,Furniture furniture,Product product, Model model) throws Exception {
		 Article article = service.read(articleId);
		 //article.setViewcnt(article.getViewcnt()+1);
		// service.artUpdate(article);
		 
		 PlanItem planItem = service.readPlanItem(article.getPlanitemId());
		 
		 List<Product> prdList = new ArrayList<Product>();
		 List<Furniture> list = service.readFurniture(article.getPlanitemId());
		 for (Furniture f : list) {
			prdList.add(service.readProduct(f.getProductId()));
		}
		 
		 model.addAttribute("product",prdList); 
		 model.addAttribute("planItem", planItem);
		 model.addAttribute("article", article);
		 
		 return "article/detail";

	}*/
	
	/** 주문별 배치도 정보 상세보기 */
	/*@RequestMapping(value="/{planId}/{planitemId}", method= RequestMethod.GET)
	public String read(Model model, @PathVariable("planId") int planId, @PathVariable("planitemId") int planitemId) throws Exception {
		
		List<PlanItem> itemList = planService.read(planId, planitemId);
		for (PlanItem items : itemList) {
			logger.info(items);
		}
		model.addAttribute("itemlist", itemList);
		
		return "plan/plan-detail";
	}*/
	
	
	/** 게시글 삭제 */
//	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
//	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
//		boardService.delete(bno);
//		rttr.addAttribute("page", cri.getPage());
//		rttr.addAttribute("perPageNum", cri.getPerPageNum());
//		rttr.addAttribute("searchType", cri.getSearchType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//		rttr.addFlashAttribute("msg", "SUCCESS");
//		
//		return "redirect:/sboard/list";
//	}
	
	
//	/** 배치도 항목 삭제 */
//	@RequestMapping(value = "/{planId}/{planitemId}", method = RequestMethod.DELETE)
//	public String remove(@PathVariable("planId") int planId, @PathVariable("planitemId") int planitemId)throws Exception{
//		itemService.delete(planId, planitemId);
//		return "redirect:/plan/plan-manage";	
//	}
}

package com.furnifit.planitem.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.furniture.domain.Furniture;
import com.furnifit.member.domain.Member;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.planitem.service.PlanItemService;


/**
 * PlanItemController 클래스
 * @author 손정화
 *
 */
@Controller
@RequestMapping("/mypage/itemlist")
public class PlanItemController {
	
	Logger logger = Logger.getLogger(PlanItemController.class);
	
	@Inject
	private PlanItemService itemService;
	
//	@Inject
//	private Furniture furniture;
	
	/** 회원별 배치도 항목 리스트 */
	@RequestMapping(value = "/{planId}/{planitemId}", method=RequestMethod.GET)
	public String listAll(@PathVariable("planId") int planId, @PathVariable("planitemId") int planitemId, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<PlanItem> itemList = itemService.listAll(planId, planitemId);
		for (PlanItem items : itemList) {
			logger.info(items);
		}
		
		
		model.addAttribute("itemlist", itemList);
		return "plan/plan-detail";
	}

	
	/** 배치도 항목 삭제 */
	@RequestMapping(value = "/{planId}/{planitemId}", method = RequestMethod.DELETE)
	public String remove(@PathVariable("planId") int planId, @PathVariable("planitemId") int planitemId)throws Exception{
		itemService.delete(planId, planitemId);
		return "redirect:/plan/plan-manage";	
	}
}

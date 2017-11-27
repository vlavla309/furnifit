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

import com.furnifit.brand.dao.BrandDao;
import com.furnifit.brand.doamin.Brand;
import com.furnifit.furniture.dao.FurnitureDao;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.member.domain.Member;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.planitem.service.PlanItemService;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;


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
	@Inject
	private FurnitureDao furniDao;
	@Inject
	private ProductService proService;
	@Inject
	private BrandDao brandDao;

	
	/** 배치도 상세정보 조회 */
	@RequestMapping(value = "/{planitemId}", method=RequestMethod.GET)
	public String read(Model model, @PathVariable("planitemId") int planItemId, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		// 치수, 평수
		PlanItem planitemList = itemService.read(planItemId);
		logger.info(planitemList);
		
		// 가구정보
		List<Product> proList = proService.list();
		List<Furniture> furniList = furniDao.list(planItemId);
		
		// 쇼핑몰 링크
		List<Brand> brandList = brandDao.list();
		
		model.addAttribute("title", "Furnifit - itemList/"+planItemId);
		model.addAttribute("planitemlist", planitemList);
		model.addAttribute("prolist", proList);
		model.addAttribute("furnilist", furniList);
		model.addAttribute("brandlist", brandList);
		return "plan/plan-detail";
	}

	/** 배치도 항목 삭제 */
	@RequestMapping(value = "/{planitemId}", method = RequestMethod.DELETE)
	public String remove(@PathVariable("planitemId") int planitemId)throws Exception{
		itemService.delete(planitemId);
		return "redirect:/plan/plan-manage";	
	}
}

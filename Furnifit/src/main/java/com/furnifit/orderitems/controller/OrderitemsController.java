package com.furnifit.orderitems.controller;

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

import com.furnifit.furniture.dao.FurnitureDao;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.member.domain.Coupon;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.CouponService;
import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orderitems.service.OrderitemsService;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.productimg.domain.ProductImg;


/**
 * OrderitemsController 클래스
 * @author 손정화
 *
 */
@Controller
@RequestMapping("/order")
public class OrderitemsController {
	
	Logger logger = Logger.getLogger(OrderitemsController.class);
	
	@Inject
	private OrderitemsService itemsService;
	@Inject
	private ProductService proService;
	@Inject
	private ProductImageDao imgDao;
	@Inject
	private CouponService couponService;
	@Inject
	private FurnitureDao furniDao;
	

	/** 주문항목 생성 */
	@RequestMapping(value = "/{planitemId}", method = RequestMethod.GET)
	public String registGET(@PathVariable("planitemId") int planitemId, Model model,  HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		logger.info("--------------planitemId : "+planitemId);
		List<Furniture> list = furniDao.list(planitemId);
		for (Furniture furniture : list) {
			logger.info(furniture);
		}
		model.addAttribute("itemlist", list);
		
		List<Product> product1 = proService.list();
		for (Product product : product1) {
			logger.info(product);
		}
		model.addAttribute("prolist", product1);	
		
		List<ProductImg> imgList = imgDao.list();
		for (ProductImg productImg : imgList) {
			logger.info(productImg);
		}
		model.addAttribute("imglist", imgList);
		
		
//		List<Coupon> couponList =  couponService.read(member.getEmail());
//		for (Coupon coupon : couponList) {
//			logger.info(coupon);
//		}
//		model.addAttribute("couponlist", couponList);		
		
		

		return "order/order-write";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String registPOST(Orderitems orderitems) throws Exception {
		logger.info(orderitems);
		itemsService.create(orderitems);
		return "redirect:/order/order-list";
	}
	
	
	
	/** 주문항목 생성 */
	/*@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get");
	}
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public String registPOST(Board board, RedirectAttributes rttr)throws Exception{
		logger.info("regist post" + board.toString());
		boardService.create(board);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}*/
	/** 주문항목 리스트 조회  */
	/*@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Product> proList = proService.list();
		for (Product product : proList) {
			logger.info(product);
		}
		
		List<ProductImg> imgList = imgDao.list();
		for (ProductImg productImg : imgList) {
			logger.info(productImg);
		}
		List<Coupon> couponList =  couponService.read(member.getEmail());
		
		model.addAttribute("prolist", proList);
		model.addAttribute("imglist", imgList);
		model.addAttribute("couponlist", couponList);
		return "order/order-write";
	}*/
	
}	

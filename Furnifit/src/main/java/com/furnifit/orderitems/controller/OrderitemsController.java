package com.furnifit.orderitems.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.furnifit.member.dao.CouponDao;
import com.furnifit.member.domain.Coupon;
import com.furnifit.member.service.CouponService;
import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orderitems.service.OrderitemsService;
import com.furnifit.product.dao.ProductDao;
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
	//private Product product;
	private ProductImageDao imgDao;
	@Inject
	private CouponService couponService;
	
	/** 주문할 가구 리스트  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception {
		List<Orderitems> list = itemsService.listAll();
		for (Orderitems orderitems : list) {
			logger.info(orderitems);
		}
		
		List<Product> proList = proService.list();
		for (Product product : proList) {
			logger.info(product);
		}
		
		List<ProductImg> imgList = imgDao.list();
		for (ProductImg productImg : imgList) {
			logger.info(productImg);
		}
		
		String email = "dd@naver.com";
		
		List<Coupon> couponList =  couponService.read(email);
		
		model.addAttribute("list", list);
		model.addAttribute("prolist", proList);
		model.addAttribute("imglist", imgList);
		model.addAttribute("couponlist", couponList);
		return "order/order-write";
	}

	
	
	/** 주문할 가구 삭제 */
	@RequestMapping(value = "/{orderId}/{productId}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("orderId") int orderId, @PathVariable("productId") int productId)throws Exception{
		ResponseEntity<String> entity = null;
		try {
			itemsService.delete(orderId, productId);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
	
	
	/** 가구 정보 상세보기 */
	/*	@RequestMapping(value = "", method = RequestMethod.GET)
		public void read(@RequestParam("productId") int productId, Model model)throws Exception{
			model.addAttribute(itemsService.read(productId));
		}*/
	
	
	// 주문서 작성 페이지
//	@RequestMapping(value = "", method=RequestMethod.GET)
//	public void formGet(@ModelAttribute("dto") Orderitems dto, Model model) throws Exception {
//		model.addAttribute("title", "Login - FurniFit");
//	}
	
	
//	@RequestMapping(value = "", method=RequestMethod.GET)
//	public void createGET(Orderitems items, Model model) throws Exception {
//		logger.info("----------create get");
//	}
//	
//	@RequestMapping(value = "", method=RequestMethod.POST)
//	public String createPOST(Orderitems items, Model model) throws Exception {
//		logger.info("----------create post");
//		
//		itemsService.create(items);
//		model.addAttribute("create", "success");
//		
//		return "redirect:/order/order-list";
//	}
	
}

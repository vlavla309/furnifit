package com.furnifit.orderitems.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	/** 가구 주문  */
	@RequestMapping(value = "/{productId}", method=RequestMethod.POST)
	public ResponseEntity<String> create(@PathVariable("productid") int productId, HttpSession session) {
		ResponseEntity<String> entity = null;
		Map<String, String> map = new HashMap<>();
		Member member = (Member) session.getAttribute("login");
		map.put("email", member.getEmail());
		map.put("productId", productId+"");
		try {
			itemsService.create(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	/** 주문할 가구항목 리스트  */
	@RequestMapping(value = "/{orderId}", method=RequestMethod.GET)
	public String listAll(@PathVariable("orderId") int orderId, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Orderitems> itemlist = itemsService.listAll(orderId);
		for (Orderitems orderitems : itemlist) {
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
		
		List<Coupon> couponList =  couponService.read(member.getEmail());
		
		model.addAttribute("itemlist", itemlist);
		model.addAttribute("prolist", proList);
		model.addAttribute("imglist", imgList);
		model.addAttribute("couponlist", couponList);
		return "order/order-write";
	}

	
	
	/** 주문할 가구 삭제 */
	/*@RequestMapping(value = "/{orderId}/{productId}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("orderId") int orderId, @PathVariable("productId") int productId)throws Exception{
		ResponseEntity<String> entity = null;
		try {
			itemsService.delete(orderId, productId);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}*/
	
}

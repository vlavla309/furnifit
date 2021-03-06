package com.furnifit.orderitems.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.coupon.domain.Coupon;
import com.furnifit.coupon.service.CouponService;
import com.furnifit.furniture.dao.FurnitureDao;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.member.domain.Member;
import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orderitems.service.OrderitemsService;
import com.furnifit.orders.domain.Orders;
import com.furnifit.orders.service.OrdersService;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.productimg.domain.ProductImg;
import com.furnifit.wishlist.service.WishlistService;


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
	private OrdersService ordersService;
	@Inject
	private FurnitureDao furniDao;
	@Inject
	private ProductService proService;
	@Inject
	private ProductImageDao imgDao;
	@Inject
	private CouponService couponService;
	@Inject
	private WishlistService wishsrv;


	/** 주문, 주문항목 생성 */
	@RequestMapping(value = "/{planitemId}", method = RequestMethod.GET)
	public String registGET(@PathVariable("planitemId") int planitemId, Model model,  HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Furniture> furniList = furniDao.list(planitemId);
		List<Product> proList = proService.total();
		List<ProductImg> imgList = imgDao.list();
		List<Coupon> couponList =  couponService.readAvailable(member.getEmail());	//사용 가능한 쿠폰 확인
		model.addAttribute("title", "Furnifit - order/"+planitemId);
		model.addAttribute("proList", proList);
		model.addAttribute("furniList", furniList);
		model.addAttribute("imgList", imgList);
		model.addAttribute("couponList", couponList);
		model.addAttribute("wishlist", wishsrv.read());
		return "order/order-write";
	}
	
	@RequestMapping(value = "/{planitemId}", method = RequestMethod.POST)
	public String registPOST(@PathVariable("planitemId") int planitemId, Orderitems orderitems, Orders order, Coupon coupon) throws Exception {
		logger.info("planitemId : "+planitemId);
		logger.info("order.getOrderId() : "+order.getOrderId());
		logger.info(orderitems);
		
		ordersService.create(order);
		
		for (int i = 0; i < orderitems.getProductIds().length; i++) {
			logger.info("orderitems.getProductIds()[i]---"+orderitems.getProductIds()[i]);
			logger.info("order.getOrderId()---"+ order.getOrderId());
			logger.info("orderitems.getAmounts()[i])---"+ orderitems.getAmounts()[i]);
			Orderitems item = new Orderitems(orderitems.getProductIds()[i], order.getOrderId(), orderitems.getAmounts()[i]);
			logger.info(item);
			itemsService.create(item);
		}
		couponService.couponUpdate(coupon);
		
		return "redirect:/mypage/order";
	}
	
}	

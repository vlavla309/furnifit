package com.furnifit.orders.controller;

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

import com.furnifit.member.domain.Coupon;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.CouponService;
import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orderitems.service.OrderitemsService;
import com.furnifit.orders.domain.Orders;
import com.furnifit.orders.service.OrdersService;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.productimg.domain.ProductImg;


/**
 * OrdersController 클래스
 * @author 손정화
 *
 */
@Controller
@RequestMapping("/mypage/order")
public class OrdersController {
	
	Logger logger = Logger.getLogger(OrdersController.class);
	
	@Inject
	private OrdersService ordersService;
	@Inject
	private ProductService proService;
	@Inject
	private CouponService couponService;
	@Inject
	private OrderitemsService itemService;
	@Inject
	private ProductImageDao imgDao;
	
	
	/** 주문생성 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Orders orders, Orderitems orderitem) throws Exception {
		logger.info("-------------------------------------------create 시작");
//		ordersService.create(orders);
		logger.info(orders);
		logger.info(orderitem);
		return "redirect:/order/order-list";
	}
	
	/** 주문내역 목록  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request) throws Exception {
//		public String listAll(@ModelAttribute("params") Params params, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		/*PageBuilder pageBuilder = new PageBuilder();
		pageBuilder.setParams(params);
		pageBuilder.setTotalPageCount(ordersService.listAll(member.getEmail());
	*/
		
		List<Orders> orderList = ordersService.listAll(member.getEmail());
		for (Orders orders : orderList) {
			logger.info(orders);
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
		
		model.addAttribute("orderlist", orderList);
		model.addAttribute("prolist", proList);
		model.addAttribute("imglist", imgList);
		model.addAttribute("couponlist", couponList);
//		model.addAttribute("pageBuilder", pageBuilder);
		return "order/order-list";
	}
	
	
	
	/** 주문내역 상세보기  */
	@RequestMapping(value ="/{orderId}", method=RequestMethod.GET)
	public String read(@PathVariable("orderId") int orderId, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Orderitems> itemList = ordersService.read(orderId);
		for (Orderitems items : itemList) {
			logger.info(items);
		}
		
		List<Product> proList = proService.list();
		for (Product product : proList) {
			logger.info(product);
		}
		
		List<Orders> orderList = ordersService.listAll(member.getEmail());
		for (Orders orders : orderList) {
			logger.info(orders);
		}
		
		List<Orders> priceList = ordersService.price(orderId);
		for (Orders price : priceList) {
			logger.info(price);
		}
		
		model.addAttribute("prolist", proList);
		model.addAttribute("itemlist", itemList);
		model.addAttribute("orderlist", orderList);
		model.addAttribute("pricelist", priceList);
		
		return "order/order-info";
	}

}

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

import com.furnifit.member.domain.Member;
import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orderitems.service.OrderitemsService;
import com.furnifit.orders.domain.Orders;
import com.furnifit.orders.service.OrdersService;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;


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
	private OrderitemsService itemsService;
	
	
	/** 주문내역 목록  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Orders> orderList = ordersService.listAll(member.getEmail());
		for (Orders orders : orderList) {
			logger.info(orders);
		}
		
		List<Product> proList = proService.list();
		for (Product product : proList) {
			logger.info(product);
		}
		
		model.addAttribute("orderlist", orderList);
		model.addAttribute("member", member);
		model.addAttribute("prolist", proList);
		return "order/order-list";
	}
	
	
	/** 주문내역 상세보기  */
	@RequestMapping(value = "/{orderId}", method=RequestMethod.GET)
	public String read(@PathVariable("orderId") int orderId, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		model.addAttribute(ordersService.read(orderId));
		
		List<Orderitems> list = itemsService.listAll(member.getEmail());
		for (Orderitems orderitems : list) {
			logger.info(orderitems);
		}
		
		List<Product> proList = proService.list();
		for (Product product : proList) {
			logger.info(product);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("prolist", proList);
		return "order/order-info";
	}

}

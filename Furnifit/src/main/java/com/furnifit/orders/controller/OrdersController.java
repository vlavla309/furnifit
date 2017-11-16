package com.furnifit.orders.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;
import com.furnifit.orders.domain.Orders;
import com.furnifit.orders.service.OrdersService;


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
	
	
	/** 주문내역 목록  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception {
		
		String email = "dd@naver.com";
		
		List<Orders> list = ordersService.listAll(email);
		for (Orders orders : list) {
			logger.info(orders);
		}
		
		
		model.addAttribute("list", list);
		return "order/order-list";
	}
	
	/** 주문내역 상세보기  */
//	@RequestMapping(value = "/{orderId}", method=RequestMethod.GET)
//	public void read(Model model) throws Exception {
//		
//		int orderId = 2;
//		
//		model.addAttribute(ordersService.read(orderId));
//	}

}

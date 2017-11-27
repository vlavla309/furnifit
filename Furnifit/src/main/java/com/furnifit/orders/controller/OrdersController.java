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

import com.furnifit.common.web.PageBuilder;
import com.furnifit.common.web.Params;
import com.furnifit.coupon.domain.Coupon;
import com.furnifit.coupon.service.CouponService;
import com.furnifit.member.domain.Member;
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
	
	private final int PAGE_SIZE = 10;  /** 페이지에 출력할 행의 수 */
	private final int PAGI_SIZE = 10;  /** 페이지에 출력할 페이지 수 (<< >> 생성)*/
	
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
	
	
	/** 주문 생성 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Orders orders, Orderitems orderitem) throws Exception {
		logger.info(orders);
		ordersService.create(orders);
		itemService.create(orderitem);
		
		return "redirect:/order/order-list";
	}
	
	/** 주문목록 리스트  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model, HttpServletRequest request, Params params) throws Exception {
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		// 페이징
		params.setPageSize(PAGE_SIZE);
		params.setPagiSize(PAGI_SIZE);
		int totalRowCount = ordersService.pageCount();
		List<Orders> orderList = ordersService.listByParams(params);
		PageBuilder pageBuilder = new PageBuilder(params, totalRowCount);
		pageBuilder.build();
		
		List<Product> proList = proService.list();
		List<ProductImg> imgList = imgDao.list();
		List<Coupon> couponList =  couponService.readAvailable(member.getEmail());	//사용 가능한 쿠폰 확인
		
		model.addAttribute("title", "Furnifit - orderList");
		model.addAttribute("orderlist", orderList);
		model.addAttribute("pageBuilder", pageBuilder);
		model.addAttribute("prolist", proList);
		model.addAttribute("imglist", imgList);
		model.addAttribute("couponlist", couponList);
		
		return "order/order-list";
	}

	
	/** 주문항목 상세보기  */
	@RequestMapping(value ="/{orderId}", method=RequestMethod.GET)
	public String read(@PathVariable("orderId") int orderId, Model model, HttpServletRequest request, Orders order, Params params) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Orderitems> itemList = itemService.read(orderId);
		List<Product> proList = proService.list();
		List<Orders> orderList = ordersService.listByParams(params);
		List<Orders> priceList = ordersService.price(orderId);
		List<ProductImg> imgList = imgDao.list();
		Coupon coupon = couponService.serialRead(orderId);	//주문 시 사용된 쿠폰 확인
		
		model.addAttribute("title", "Furnifit - orderId/"+order.getOrderId());
		model.addAttribute("prolist", proList);
		model.addAttribute("itemlist", itemList);
		model.addAttribute("orderlist", orderList);
		model.addAttribute("pricelist", priceList);
		model.addAttribute("imglist", imgList);
		model.addAttribute("coupon", coupon);
		
		return "order/order-info";
	}
}

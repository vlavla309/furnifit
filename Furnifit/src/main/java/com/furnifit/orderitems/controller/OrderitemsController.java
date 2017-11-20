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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.furnifit.furniture.dao.FurnitureDao;
import com.furnifit.furniture.domain.Furniture;
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
	private ProductService proService;
	@Inject
	private ProductImageDao imgDao;
	@Inject
	private CouponService couponService;
	@Inject
	private FurnitureDao furnidao;
	
	
	/*@RequestMapping(value = "/{productId}", method=RequestMethod.POST)
	public ResponseEntity<String> create(@PathVariable("productId") int productId, HttpSession session) {
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
	}*/
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Orderitems items, Orders order, RedirectAttributes rttr) throws Exception{
		logger.info("등록 post : " + items.toString());
		itemsService.create(items);
		ordersService.create(order);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/order/order-list";
	}
	
	/*@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Orderitems items) {
		itemsService.create(items);
		logger.info(items);
		return "redirect:/order/order-list";
	}*/
	
	
	/** 주문할 가구항목 리스트  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String createGet(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		
		List<Furniture> itemlist = furnidao.list(1);
		for (Furniture furni : itemlist) {
			logger.info(furni);
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

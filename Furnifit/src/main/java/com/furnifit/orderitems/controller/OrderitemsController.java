package com.furnifit.orderitems.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orderitems.service.OrderitemsService;


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
	
	//@Inject
	//private Product product;
	
	//@Inject
	//private ProductDao proDao;
	
	
	/** 주문할 가구 리스트  */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception {
		List<Orderitems> list = itemsService.listAll();
		for (Orderitems orderitems : list) {
			logger.info(orderitems);
		}
		
		//List<Product> proList = 
		
		model.addAttribute("list", list);
		return "order/order-write";
	}

	/** 가구 정보 상세보기 */
/*	@RequestMapping(value = "", method = RequestMethod.GET)
	public void read(@RequestParam("productId") int productId, Model model)throws Exception{
		model.addAttribute(itemsService.read(productId));
	}*/
	
	/** 주문할 가구 삭제 */
	@RequestMapping(value = "/{orderId}", method = RequestMethod.DELETE)
	public String remove(@PathVariable("orderId") int orderId, RedirectAttributes rttr)throws Exception{
		itemsService.delete(orderId);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/order/order-write";
	}
	
//	/** 주문할 가구 등록 */
//	@RequestMapping(value = "", method=RequestMethod.GET)
//	public void createGET(Orderitems items, Model model) throws Exception {
//		logger.info("----------create get");
//	}
//	@RequestMapping(value = "", method=RequestMethod.POST)
//	public String createPOST(Orderitems items, Model model) throws Exception {
//		logger.info("----------create post"+items.toString());
//		
//		itemsService.create(items);
//		model.addAttribute("create", "success");
//		
//		return "redirect:/order/order-list";
//	}
	
	//@Inject
	//private Product product;
	
	//private ProductDao proDao;
	
	// 주문서 작성 페이지
//	@RequestMapping(value = "", method=RequestMethod.GET)
//	public void formGet(@ModelAttribute("dto") Orderitems dto, Model model) throws Exception {
//		model.addAttribute("title", "Login - FurniFit");
//	}
	
	@RequestMapping(value = "/test", method=RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<Orderitems> list = itemsService.listAll();
		for (Orderitems orderitems : list) {
			logger.info(orderitems);
		}
		
		//List<Product> proList = 
		
		model.addAttribute("list", list);
		return "order/order-list";
	}
	
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
	
	
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public void form() {}	
//	
//	/** 주문할 가구 리스트  */
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public void listAll(Model model)throws Exception{
//		logger.info(model.toString());
//		itemsService.listAll();
//		
//		model.addAttribute("list", itemsService.listAll());
//
//	}
}

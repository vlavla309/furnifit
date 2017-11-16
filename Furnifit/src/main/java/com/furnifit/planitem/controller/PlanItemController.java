package com.furnifit.planitem.controller;

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
 * PlanItemController 클래스
 * @author 손정화
 *
 */
@Controller
@RequestMapping("/mypage/itemlist")
public class PlanItemController {
	

}

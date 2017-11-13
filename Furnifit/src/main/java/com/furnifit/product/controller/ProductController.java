package com.furnifit.product.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	Logger logger = Logger.getLogger(ProductController.class);
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void form() {}	
	
}

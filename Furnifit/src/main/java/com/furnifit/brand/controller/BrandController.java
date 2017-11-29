package com.furnifit.brand.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Brand Controller 클래스
 * 
 * @author 김호준
 * 
 */
@Controller
@RequestMapping("/brand")
public class BrandController {
	/* 로그 확인 */
	private static final Logger logger = Logger.getLogger(BrandController.class);
	
	// brand 페이지
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String signup() {
		logger.debug("brand 페이지");
		return "/brand";
	}
}

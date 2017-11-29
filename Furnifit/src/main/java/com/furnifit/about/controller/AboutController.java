package com.furnifit.about.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * About Controller 클래스
 * 
 * @author 손정화
 * 
 */
@Controller
@RequestMapping("/about")
public class AboutController {
	/* 로그 확인 */
	private static final Logger logger = Logger.getLogger(AboutController.class);
	
	// about 페이지
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String signup() {
		logger.debug("about 페이지");
		return "/about";
	}
}

package com.furnifit.member.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;


@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	Logger log = Logger.getLogger(MypageController.class);

	@Inject
	private MemberService memberService;

	// 마이페이지
	@RequestMapping(value = "/mypage", method=RequestMethod.GET)
	public String mypage() {
		log.debug("마이페이지");
		return "mypage/mypage";
	}
}

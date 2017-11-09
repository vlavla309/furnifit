package com.furnifit.member.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;


@Controller
public class MemberController {
	
	Logger log = Logger.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String loginGet(Model model) throws Exception {
		model.addAttribute("title", "Login - FurniFit");
		return "member/login";
	}
	
	// 로그인 처리
		@RequestMapping(value = "/login", method=RequestMethod.POST)
		public void loginPost(LoginDTO dto, Model model) throws Exception {
			log.info("Param : "+dto);
			Member member = memberService.login(dto);
			
			if(member != null) {
				model.addAttribute("member",  member);
			}
		}
	
	// 로그아웃 처리
	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Cookie loginCookie = WebUtils.getCookie(request, "login");
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
		
		return "redirect:/";
		
	}

}









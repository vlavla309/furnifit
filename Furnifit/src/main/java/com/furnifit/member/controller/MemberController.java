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
@RequestMapping(value = "/member")
public class MemberController {

	Logger log = Logger.getLogger(MemberController.class);

	@Inject
	private MemberService memberService;

	// 로그인 페이지
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public void loginGet(@ModelAttribute("dto") LoginDTO dto, Model model) throws Exception {
		model.addAttribute("title", "Login - FurniFit");
	}

	// 로그인 처리
	@RequestMapping(value = "/loginAction", method=RequestMethod.POST)
	public void logisnAction(LoginDTO dto, HttpSession session, Model model) throws Exception {
		Member member = memberService.login(dto);
		log.info("회원 : "+member);
		if(member == null) {
			log.info("회원없음");
			return ;
		}
		
		log.info("회원있음");
		model.addAttribute("member",  member);
		if(dto.isAutologin()) {
			int amount= 60*60*24*7; //일주일
			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			
			memberService.keepLogin(member.getEmail(), session.getId(), sessionLimit);
		}
	}

	// 로그아웃 처리
	@RequestMapping(value = "logout", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Cookie loginCookie = WebUtils.getCookie(request, "login");
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);

		return "redirect:/";

	}

}









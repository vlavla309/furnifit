<<<<<<< HEAD
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
	
	// 회원가입
	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public String signup() {
		log.debug("회원가입 폼");
		return "member/signup";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String signup(Member member) throws Exception {
		log.debug("회원가입 처리");
		memberService.create(member);
		return "/";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/edit", method=RequestMethod.GET)
	public String editSignup() {
		log.debug("회원정보 수정 폼");
		return "member/editSignup";
	}
	
	// 회원정보 수정 처리
	@RequestMapping(value = "/edit", method=RequestMethod.POST)
	public String editSignup(Member member, HttpSession session) throws Exception {
		log.debug("회원정보 수정 처리");
		Member loginMember = (Member) session.getAttribute("member");
		String email = loginMember.getEmail();
		
		if(member.getPhone() == null) {
			member.setPhone(loginMember.getPhone());
		}
		if(member.getPasswd() == null) {
			member.setPasswd(loginMember.getPasswd());
		}
		if(member.getName() == null) {
			member.setName(loginMember.getName());
		}
		
		member.setEmail(email);
		int check = memberService.update(member);
		if(check == 1) {
			session.setAttribute("member", member);
		}
		
		return "/";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/withdraw", method=RequestMethod.GET)
	public String delete() {
		log.debug("mypage 회원 탈퇴");
		return "member/mypage";
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value = "/withdraw", method=RequestMethod.POST)
	public String delete(String email, String passwd, Model model) throws Exception {
		log.debug("회원 탈퇴 처리");
		/*
		Member loginMember = (Member) session.getAttribute("member");
		String password = loginMember.getPasswd();
		*/
		boolean result = memberService.checkPw(email, passwd);
		
		if(result) {
			memberService.delete(email);
			return "/";
		} else {
			model.addAttribute("비밀번호가 일치하지 않습니다.");
			return "member/mypage";
		}
	}
}








=======
package com.furnifit.member.controller;

import java.util.Date;
import java.util.List;

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
import com.furnifit.orderitems.domain.Orderitems;


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








>>>>>>> 288c849bfdc4a73bab49826e3cb6fda36e4cdfa4

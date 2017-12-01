package com.furnifit.member.controller;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;

/**
 * Member Controller 클래스
 * 
 * @author 김호준
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	/* 로그 확인 */
	Logger log = Logger.getLogger(MemberController.class);

	@Inject                               // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private MemberService memberService;  // root-context.xml 파일에 <context:component-scan /> 태그가 설정되어 있어야 한다.

	/** 로그인 페이지로 이동 */
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public void loginGet(@ModelAttribute("dto") LoginDTO dto, Model model) throws Exception {
		model.addAttribute("title", "Login - FurniFit");
	}

	/** 로그인 처리 */
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

	/** 로그아웃 처리 */
	@RequestMapping(value = "logout", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Member user = (Member)session.getAttribute("login");
		if(user != null) {
			session.removeAttribute("login");
			session.invalidate();
		}		
		return "redirect:/";
	}
	
	/** 회원가입 */
	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public String signup() {
		log.debug("회원가입 폼");
		return "member/signup";
	}
	
	/** 회원가입 처리 */
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public void signup(Member member, HttpServletResponse response) throws Exception {
		log.debug("회원가입 처리");
		memberService.create(member);
		/*return "redirect:/";*/
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('성공적으로 회원 가입을 완료하였습니다.'); location.href='/one/';</script>");
	}
	
	/** 회원 가입 폼에서 이메일 중복 체크 */
	@RequestMapping(value = "/checkSignup", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idCheck(Member member, Model model) {
		return memberService.checkSignup(member);
	}
	
	/** 회원정보 수정 */
	@RequestMapping(value = "/edit", method=RequestMethod.GET)
	public String editSignup() {
		log.debug("회원정보 수정 폼");
		return "member/editSignup";
	}
	
	/** 회원정보 수정 처리 */
	@RequestMapping(value = "/edit", method=RequestMethod.POST)
	public String editSignup(Member member, HttpSession session) throws Exception {
		
		int check = memberService.update(member);
		if(check == 1) {
			session.setAttribute("member", member);
		}
		return "redirect:/";
	}

	/** 회원 탈퇴 */
	@RequestMapping(value = "/withdraw", method=RequestMethod.GET)
	public String delete() {
		log.debug("mypage 회원 탈퇴");
		return "member/mypage";
	}
	
	/** 회원 탈퇴 처리 */
	@RequestMapping(value = "/withdraw", method=RequestMethod.POST)
	public String delete(String email, String passwd, Model model) throws Exception {
		log.debug("회원 탈퇴 처리");
		
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

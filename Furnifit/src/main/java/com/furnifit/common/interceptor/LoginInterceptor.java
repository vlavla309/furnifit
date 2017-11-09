package com.furnifit.common.interceptor;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;
/**
 * 세션을 이용한 사용자 로그인 정보 저장 인터셉터
 *
 * @author 김형주
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	
	Logger logger = Logger.getLogger(LoginInterceptor.class);
	
	@Inject
	private MemberService memberService;
	
	/** 기본 세션에 남아있는 사용자정보가 존재할 경우 삭제 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) != null) {
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		Member member = (Member) modelAndView.getModel().get("member");
		if(member != null) {
			logger.info("Login Success!!!");
			session.setAttribute(LOGIN, member);
			
			// 자동 로그인 체크시
			if(request.getParameter("autologin") != null) {
				logger.info("사용자가 자동로그인 체크");
				
				String sessionid = session.getId();
				int amount = 60 * 60 * 24 * 7; // 7일간 저장
				Date sessionlimit = new Date(System.currentTimeMillis() + (1000 * amount));

				// 사용자 테이블의 sessionid와 sessionlimt 컬럼 수정
				memberService.setAutoLogin(member.getEmail(), sessionid, sessionlimit);
				
				// 세션아이디(세션아이디쿠키) 저장 사용자 쿠키 생성
				Cookie autoLoginCookie = new Cookie("autoLoginCookie", session.getId());
				autoLoginCookie.setPath("/");
				autoLoginCookie.setMaxAge(60 * 60 * 24 * 7); 
				response.addCookie(autoLoginCookie);
			}
			
			// 홈으로 이동
//			response.sendRedirect(request.getServletContext().getContextPath());
			
			// 로그인 전의 해당 경로로 이동
			String referer = (String)session.getAttribute("referer");
			if(referer != null) {
				response.sendRedirect(referer);
			} else {
				response.sendRedirect(request.getServletContext().getContextPath());
			}
		}
		
	}

}

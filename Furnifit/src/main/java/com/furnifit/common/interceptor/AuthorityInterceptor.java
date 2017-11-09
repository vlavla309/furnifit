package com.furnifit.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;

/**
 * 현재 사용자가 로그인한 상태의 사용자인지를 체크하는 인터셉터
 *
 * @author 김형주
 */
public class AuthorityInterceptor extends HandlerInterceptorAdapter{
	
	Logger logger = Logger.getLogger(AuthorityInterceptor.class);
	
	@Inject
	private MemberService memberServ;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("login");
		
		if(user == null) {
			logger.info("현재 사용자는 로그인하지 않은 상태입니다..");
			saveReferer(request);
			
			// HttpSession에 로그인 정보가 없지만, autoLoginCookie가 존재할 경우 자동 로그인 처리
			Cookie autoLoginCookie = WebUtils.getCookie(request, "autoLoginCookie");
			
			response.sendRedirect(request.getServletContext().getContextPath() + "/user/login");
			return false;
		}
		request.setAttribute("user", user);
		return true;
	}
	
	/** 
	 * 로그인 하지 않은 상태의 사용자가 인터셉터에 의해 로그인 페이지로 이동된 후
	 * 로그인이 완료되면 홈(/)이 아닌 해당 경로로 이동시켜주기 위해 원래 URI 저장 
	 */
	private void saveReferer(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		if(query == null || query.equalsIgnoreCase("null")) {
			query = "";			
		}else {
			query = "?" + query;
		}
		
		uri += query;
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			logger.info("원래 접근하려던 경로: " + uri);
			// 세션에 저장
			request.getSession().setAttribute("referer", uri);
		}
	}

}

package com.furnifit.common.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 세션을 이용한 사용자 로그인 정보 저장 인터셉터
 *
 * @author 김형주
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "login";

	Logger log = Logger.getLogger(LoginInterceptor.class);

	/** 기본 세션에 남아있는 사용자정보가 존재할 경우 삭제 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) != null) {
			session.removeAttribute(LOGIN);
		}
		if(session.getAttribute("err") != null) {
			session.removeAttribute("err");
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object member = modelMap.get("member");

		if (member != null) {

			log.debug("new login success");
			session.setAttribute(LOGIN, member);

			if (request.getParameter("useCookie") != null) {

				log.debug("remember me................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			// response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String) dest : request.getServletContext().getContextPath());
		}else {
			session.setAttribute("err", "failed");
			response.sendRedirect(request.getServletContext().getContextPath()+"/member/login");
		}
	}
}

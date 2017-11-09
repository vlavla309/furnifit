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

	Logger log = Logger.getLogger(AuthorityInterceptor.class);

	@Inject
	private MemberService memberServ;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");

		if(member == null){

			log.debug("current member is not logined");

			saveDest(request);

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if(loginCookie != null) { 

				member = memberServ.checkLoginBefore(loginCookie.getValue());

				log.debug("Member: " + member);

				if(member != null){
					session.setAttribute("login", member);
					return true;
				}
			}

			response.sendRedirect(request.getServletContext().getContextPath()+"/member/login");
			return false;
		}
		return true;
	}  


	/** 
	 * 로그인 하지 않은 상태의 사용자가 인터셉터에 의해 로그인 페이지로 이동된 후
	 * 로그인이 완료되면 홈(/)이 아닌 해당 경로로 이동시켜주기 위해 원래 URI 저장 
	 */


	private void saveDest(HttpServletRequest req) {

		String uri = req.getRequestURI();

		String query = req.getQueryString();

		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}

		if (req.getMethod().equals("GET")) {
			log.info("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}

}




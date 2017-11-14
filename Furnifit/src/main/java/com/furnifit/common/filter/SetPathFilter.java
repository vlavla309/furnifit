package com.furnifit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * view에서 이미지, js, css파일의 경로나 링크 경로를 지정할 때 ContextPath 및 리소스 파일의 경로를 미리 지정한다(단축가능)
 * ex) ${pageContext.servletContext.contextPath}/resources/  ->  ${rSrcPath}   
 * @author 김형주
 *
 */
public class SetPathFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException{}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		request.setAttribute("rSrcPath", req.getContextPath()+"/resources/");
		request.setAttribute("contextPath", req.getContextPath()+"");
		chain.doFilter(request, response);
			
	}

	@Override
	public void destroy() {	}

	

}

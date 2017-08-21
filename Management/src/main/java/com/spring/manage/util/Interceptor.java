package com.spring.manage.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			String address = (String)request.getAttribute("address");
			
			if(address == null) {
				request.getRequestDispatcher("member/join");
				return false;
			}
			else return true;
	
	}

}

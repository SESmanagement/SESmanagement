package com.spring.manage.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.manage.vo.MemberVO;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
			HttpSession session = request.getSession();
			MemberVO vo = (MemberVO)session.getAttribute("vo");			
			
			if(vo.getAddress() == null) {
				request.getRequestDispatcher("member/join");
				return false;
			}
			else return true;
	
	}

}

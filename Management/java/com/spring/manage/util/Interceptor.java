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
			System.out.println("인터셉터"+vo);
			if(vo == null){
				response.sendRedirect("/manage/member/loginform");
				return false;
			}else if(vo.getStudent_num() == 0){
				response.sendRedirect("/manage/member/join");
				return false;
			}else if(vo.getAddress1() == null) {
				return false;
			}
			else return true;
	
	}

}

package com.spring.manage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.manage.service.MemberService;
import com.spring.manage.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value ="login", method= RequestMethod.POST)
	public String login(HttpSession session, int student_num, String pwd, MemberVO vo){
		vo.setStudent_num(student_num);
		vo.setPwd(pwd);
		vo = service.login(vo);
		session.setAttribute("vo", vo);
		return "home";
	}
	
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "join";	
	}
	
	
	
}

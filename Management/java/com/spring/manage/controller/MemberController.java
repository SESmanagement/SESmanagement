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
		return "redirect:/";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//수정창으로 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "join";	
	}
	
	//회원가입처리
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(String pwd, String zip, String addr1, String addr2, String email, HttpSession session) {
		MemberVO vo = (MemberVO)session.getAttribute("vo");
		vo.setPwd(pwd);
		vo.setZip(zip);
		vo.setAddress(addr1+","+addr2);
		vo.setEmail(email);
		if(service.join(vo)==false) {
			session.setAttribute("result", service.join(vo));
			return "join";
		}
		return "redirect:/";	
	}
	
	
	
	
	
}
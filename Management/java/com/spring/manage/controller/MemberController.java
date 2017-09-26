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
	
	
	//로그인 화면으로 이동
	@RequestMapping(value="loginform", method=RequestMethod.GET)
	public String loginform(){
		return "loginform";
	}
	
	//학번, 비밀번호 찾기 창으로 이동
	@RequestMapping(value = "search_member", method=RequestMethod.GET)
	public String search_member(){
		return "member/searchMember";
	}
	
	@RequestMapping(value ="login", method= RequestMethod.POST)
	public String login(HttpSession session, MemberVO vo){
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
	public String join(MemberVO vo, HttpSession session) {
		System.out.println("수정하러가자"+vo);
		if(service.join(vo)==false) {
			session.setAttribute("result", service.join(vo));
			return "join";
		}
		return "redirect:/";	
	}
	
	
	
	
	
}

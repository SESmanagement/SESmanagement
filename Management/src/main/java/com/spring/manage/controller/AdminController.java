package com.spring.manage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.manage.service.BookService;
import com.spring.manage.vo.MemberVO;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private BookService service;
	
	//대출목록으로 이동
	@RequestMapping(value="/lendList", method=RequestMethod.GET)
	public String lendList(HttpSession session, Model model){
		MemberVO vo = (MemberVO)session.getAttribute("vo");
		int student_num = vo.getStudent_num();
		if(student_num == 00001){
			return "admin/lendList";
		}else{
			model.addAttribute("msg","로그인하세요");
			return "home";
		}
	}
}
package com.spring.manage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.AdminService;
import com.spring.manage.vo.LendVO;
import com.spring.manage.vo.MemberVO;




@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService a_service;

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
	
	//대출목록 불러오기
	@RequestMapping(value="/lentList", method=RequestMethod.GET)
	public @ResponseBody List<LendVO> lentList(
			@RequestParam(value="adminSearchType", defaultValue="title") String adminSearchType,
			@RequestParam(value="adminSearchValue", defaultValue="") String adminSearchValue
	){
		//연체인 경우 갱신
		a_service.updateDelayed();
		return a_service.getStatusList("lent", adminSearchType, adminSearchValue);
	}
}
package com.spring.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.GroupServiceImpl;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;


@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupServiceImpl service;
	
	//참여중인 소모임 화면이동
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("list", service.list());
		return "group/group_home";
	}
	
	//소모임 모집하기로 화면이동
	@RequestMapping(value="seek", method=RequestMethod.GET)
	public String seek(){
		return "group/group_seek";
	}
	
	//소모임 모집하기 form 실행
	@RequestMapping(value="group_seek", method=RequestMethod.POST)
	public String seek(GroupVO vo){
		if(service.seek(vo)){	//true면
			return "group/group_home";
		}else return "group/group_seek";
	}
	
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int group_num, Model model){
		model.addAttribute("list",service.detail(group_num));
		System.out.println(service.detail(group_num));
		return "group/group_detail";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	@ResponseBody
	public boolean join(GroupJoinVO vo2){
		return service.join(vo2);
	}
	
	
	
	
}
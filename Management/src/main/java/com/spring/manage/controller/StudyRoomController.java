package com.spring.manage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.StudyRoomService;
import com.spring.manage.vo.StudyRoomVO;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService service;
	
	@RequestMapping(value = "rooms", method = RequestMethod.GET)
	public String rooms() {
		System.out.println("음");
		return "studyroom/rooms";
	}
	
	@RequestMapping(value = "showInside", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<StudyRoomVO> showInside(int studyroom_num, ArrayList<StudyRoomVO> srList) {
		srList = service.showInside(studyroom_num);
		return srList;
	}
	@RequestMapping(value = "reserveRoomForm", method = RequestMethod.GET)
	public String reserveRoomForm(int studyroom_num, ArrayList<StudyRoomVO> srList, Model model) {
		srList = service.showInside(studyroom_num);
		model.addAttribute(srList);
		return "/manage/studyroom/reserveRoomForm";
	}
	
	
	
}

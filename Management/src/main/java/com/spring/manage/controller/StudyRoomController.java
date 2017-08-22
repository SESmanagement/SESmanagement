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
	
	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	@RequestMapping(value = "rooms", method = RequestMethod.GET)
	public String rooms() {
		return "studyroom/rooms";
	}
	
	// 마우스 오버시 해당 스터디룸(studyroom_num) 예약현황 툴팁 띄우기
	@RequestMapping(value = "showInside", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<StudyRoomVO> showInside(int studyroom_num, ArrayList<StudyRoomVO> srList) {
		srList = service.showInside(studyroom_num);
		return srList;
	}
	
	// 마우스 클릭시 해당 스터디룸(studyroom_num) 예약폼 페이지로 이동
	@RequestMapping(value = "reserveRoomForm", method = RequestMethod.GET)
	public String reserveRoomForm(int studyroom_num, ArrayList<StudyRoomVO> srList, Model model) {
		srList = service.showInside(studyroom_num);
		model.addAttribute(srList);
		return "studyroom/reserveRoomForm";
	}
	
	
	
}

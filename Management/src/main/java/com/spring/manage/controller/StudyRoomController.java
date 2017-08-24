package com.spring.manage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.StudyRoomService;
import com.spring.manage.vo.SR_ReservationVO;
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
	
	// 마우스 오버시 해당 스터디룸(studyroom_num) 예약현황 팝업창 띄우기
	@RequestMapping(value = "showInside", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<StudyRoomVO> showInside(int studyroom_num, ArrayList<StudyRoomVO> srList) {
		srList = service.showInside(studyroom_num);
		return srList;
	}
	
	// 해당 스터디룸의 예약폼 페이지로 이동 (+좌석 정보, 조회시점 시각 조회)
	@RequestMapping(value = "reserveRoomForm", method = RequestMethod.GET)
	public String reserveRoomForm(int studyroom_num, ArrayList<StudyRoomVO> srList, ArrayList<SR_ReservationVO> srResvList, Model model, String sysdate) {
		srList = service.showInside(studyroom_num);
		model.addAttribute("studyroom_num", studyroom_num);
		model.addAttribute("srList", srList);
		sysdate = service.getSysdate();
		model.addAttribute("sysdate", sysdate);
		return "studyroom/reserveRoomForm";
	}
	//만날 수 없어 말하고 싶은데 그런 슬픈 기분인걸 말하고 싶어 말하고 싶은데 속마음만 숨기는걸 내 사랑의 마지막 열쇠가 있다면 그건 바로 이 세상이 아름다운 이유 캐치유 캐치유 캐치미 캐치미 이제 숨바꼭질은 그만 우울한거 모두 파란하늘에 묻어버려
	// 해당 스터디룸의 예약현황 
	@RequestMapping(value = "srResvInfo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num, ArrayList<SR_ReservationVO> srResvList, Model model) {
		srResvList = service.srResvInfo(studyroom_num);
		return srResvList;
	}
	
	// 스터디룸 예약 신청
	@RequestMapping(value = "resvApply", method = RequestMethod.GET)
	public String resvApply(String[] resvApplyArr) {
//		String id
		service.resvApply(resvApplyArr);
		return "studyroom/myReserveInfo";
	}
	
}

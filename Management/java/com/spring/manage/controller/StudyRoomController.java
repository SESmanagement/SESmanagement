package com.spring.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.StudyRoomService;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {//
	
	@Autowired
	private StudyRoomService service;
	
	// 관리자 메뉴- 스터디룸 관리 페이지로 이동 
	@RequestMapping(value = "adminPage", method = RequestMethod.GET)
	public String adminPage(StudyRoomVO vo, Model model, String result) {
		model.addAttribute("sysdate", service.getSysdate());
		model.addAttribute("result", result);
		return "studyroom/adminPage";
	}
	
	// 관리자 메뉴- 해당 스터디룸의 좌석 배치 페이지를 호출
	@RequestMapping(value = "getStudyRoomInfo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<StudyRoomVO> getStudyRoomInfo(int studyroom_num) {
		service.updateSeated_status();
		return service.showInside(studyroom_num);
	}
	
	// 관리자 메뉴- 현재 DB에 저장되어 있는 스터디룸 정보 가져오기
	@RequestMapping(value = "getStudyRoomLocation", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<StudyRoomVO> getStudyRoomLocation() {
		return service.getStudyRoomLocation();
	}
	
	// 관리자 메뉴- 현재 DB-SR_Facility에 저장되어 있는 해당 스터디룸의 부대시설정보 가져오기
	@RequestMapping(value = "getSRFacilityInfo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SR_FacilityVO> getSRFacilityInfo(int studyroom_num) {
		return service.getSRFacilityInfo(studyroom_num);
	}
	
	// 관리자 메뉴- 스터디룸의 좌석 비활성화 처리하기
	@RequestMapping(value = "inactivateSR_Seat", method = RequestMethod.POST)
	public String inactivateSR_Seat(String selectedList, Model model) {
		boolean result = service.inactivateSR_Seat(selectedList);
		return "redirect:adminPage?result="+result;
	}
	
	// 관리자 메뉴- 스터디룸의 좌석 / 부대시설 등록하기
	@RequestMapping(value = "addSR_Seat", method = RequestMethod.POST)
	public String addSR_Seat(String selectedList, Model model) {
		String result = service.addSR_Seat(selectedList);
		return "redirect:adminPage?result="+result;
	}
	
	// 관리자 메뉴- 스터디룸의 좌석 / 부대시설 삭제하기
	@RequestMapping(value = "dropSR_Seat", method = RequestMethod.POST) // 
	public String dropSR_Seat(String selectedList, Model model) {
		String result = service.dropSR_Seat(selectedList);
		return "redirect:adminPage?result="+result;
	}
	
	// 관리자 메뉴- 스터디룸의 좌석 비활성화 처리하기
	@RequestMapping(value = "inactivateSR", method = RequestMethod.POST)
	public String inactivateSR(String selectedList, Model model) {
		boolean result = service.inactivateSR(selectedList);
		return "redirect:adminPage?result="+result;
	}
	
	// 관리자 메뉴- 스터디룸 등록하기
	@RequestMapping(value = "addSR", method = RequestMethod.POST)
	public String addSR(String selectedList, Model model) {
		String result = service.addSR(selectedList);
		return "redirect:adminPage?result="+result;
	}
	
	// 관리자 메뉴- 스터디룸 삭제하기
	@RequestMapping(value = "dropSR", method = RequestMethod.POST)
	public String dropSR(String selectedList, Model model) {
		String result = service.dropSR(selectedList);
		return "redirect:adminPage?result="+result;
	}
	
	// 관리자 메뉴-예약 내역 조회 페이지로 이동
	@RequestMapping(value = "searchResult") // , method = RequestMethod.GET
	public String searchResult(Model model) {
		model.addAttribute("sysdate", service.getSysdate());
		return "studyroom/searchResult";
	}
	
	// 관리자 메뉴-예약 내역 조회하기
	@RequestMapping(value = "getResvList") // , method = RequestMethod.POST
	public String getResvList(Model model, HashMap<String, Object> returnMap,
			ArrayList<SR_ReservationVO> resvList, PageNavigator navi,
			@RequestParam(value="studyroom_checkList", defaultValue="") ArrayList<String> studyroom_checkList,
			@RequestParam(value="date_checkList", defaultValue="") ArrayList<String> date_checkList,
			@RequestParam(value="etc_checkList", defaultValue="") ArrayList<String> etc_checkList,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		// 검색 조건 model에 담기
		model.addAttribute("studyroom_checkList", studyroom_checkList);
		model.addAttribute("date_checkList", date_checkList);
		model.addAttribute("etc_checkList", etc_checkList);
		
		// 예약건 검색내역
		returnMap = service.getResvList(studyroom_checkList, date_checkList, etc_checkList, currentPage);
		resvList = (ArrayList<SR_ReservationVO>) returnMap.get("resvList");
		navi = (PageNavigator) returnMap.get("navi");
		
		// 검색할 때 저 3개를 안 가지고 가서 전체를 끌고 옴... 그래서 한번에 다 펼쳐짐????
		model.addAttribute("resvList", resvList);
		model.addAttribute("navi", navi);

		return "studyroom/searchResult";
	}
	
	/////////////////////////////////////////////////////////////////////////
	
	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	@RequestMapping(value = "rooms", method = RequestMethod.GET)
	public String rooms(Model model, ArrayList<SR_ReservationVO> allSrList) {
		model.addAttribute("sysdate", service.getSysdate());
		return "studyroom/rooms";
	}
	
	// 마우스 오버시 해당 스터디룸(studyroom_num) 예약현황 팝업창 띄우기
	@RequestMapping(value = "showInside", method = RequestMethod.GET) // 
	@ResponseBody
	public ArrayList<StudyRoomVO> showInside(int studyroom_num, ArrayList<StudyRoomVO> srList) {
		service.updateSeated_status(); // STUDYROOM
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
	
	// 해당 스터디룸의 예약현황 
	@RequestMapping(value = "srResvInfo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num, ArrayList<SR_ReservationVO> srResvList, Model model) {
		srResvList = service.srResvInfo(studyroom_num);
		return srResvList;
	}
	
	// 스터디룸 예약 신청
	@RequestMapping(value = "resvApply", method = RequestMethod.GET)
	public String resvApply(String[] resvApplyArr, HttpSession session, String sysdate, ArrayList<SR_ReservationVO> myResvList, Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		int student_num = vo.getStudent_num(); // 세션의 학생번호
		service.resvApply(resvApplyArr, student_num); // 예약 신청 하기
		model.addAttribute("student_num", student_num);
		return "redirect:myResvInfoPage?student_num="+student_num;
	}
	
	// 나의 오늘자 스터디룸 예약현황 조회
	@RequestMapping(value = "myResvInfo")
	@ResponseBody
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num, ArrayList<SR_ReservationVO> myResvList, Model model) {
		myResvList = service.myResvInfo(student_num);
		return myResvList;
	}
	
	// 내 스터디룸 예약현황 페이지로 이동
	@RequestMapping(value = "myResvInfoPage")
	public String myResvInfoPage(int student_num, ArrayList<SR_ReservationVO> myResvList, Model model, String sysdate,
								String cancelResult) {
		myResvList = service.myResvInfoAll(student_num);
		sysdate = service.getSysdate();
		model.addAttribute("myResvList", myResvList);
		model.addAttribute("sysdate", sysdate);
		model.addAttribute("cancelResult", cancelResult);
		model.addAttribute("student_num", student_num);
		return "studyroom/myResvInfo";
	}
	
	// 스터디룸 예약 취소
	@RequestMapping(value = "cancelMySRR", method = RequestMethod.POST)
	public String cancelMySRR(String checkList, int student_num, Model model) {
		boolean cancelResult = service.cancelMySRR(checkList); // 예약취소
		model.addAttribute("cancelResult", cancelResult);
		return "redirect:myResvInfoPage?student_num="+student_num;
	}
	
	// 시간대별 에약가능현황 조회
	@RequestMapping(value = "checkAvailableRoom", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<StudyRoomVO> checkAvailableRoom(String checkList, ArrayList<StudyRoomVO> availableRoomList,
											@RequestParam(value="checkList[]") ArrayList<Integer> checkListList) {
		availableRoomList = service.checkAvailableRoom(checkListList);
		return availableRoomList;
	}
	
	// 현시점 에약가능현황 조회
	@RequestMapping(value = "nowAvailableRoom", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<StudyRoomVO> nowAvailableRoom(ArrayList<StudyRoomVO> nowAvailableRoomList, String now_time) {
		nowAvailableRoomList = service.nowAvailableRoom(now_time);
		return nowAvailableRoomList;
	}
	
}

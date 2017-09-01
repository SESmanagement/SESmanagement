package com.spring.manage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.manage.service.StudyRoomService;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService service;
	
	// 관리자 메뉴- 스터디룸 관리 페이지로 이동 + 현재 DB에 저장되어 있는 스터디룸 정보 가져오기
	@RequestMapping(value = "adminPage", method = RequestMethod.GET)
	public String adminPage(StudyRoomVO vo, Model model) {
		model.addAttribute(service.showInside(000));
		return "studyroom/adminPage";
	}
	
	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	@RequestMapping(value = "rooms", method = RequestMethod.GET)
	public String rooms(Model model) {
		model.addAttribute("sysdate", service.getSysdate());
		return "studyroom/rooms";
	}
	
	// 마우스 오버시 해당 스터디룸(studyroom_num) 예약현황 팝업창 띄우기
	@RequestMapping(value = "showInside", method = RequestMethod.GET)
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
	//만날 수 없어 말하고 싶은데 그런 슬픈 기분인걸 말하고 싶어 말하고 싶은데 속마음만 숨기는걸 내 사랑의 마지막 열쇠가 있다면 그건 바로 이 세상이 아름다운 이유 캐치유 캐치유 캐치미 캐치미 이제 숨바꼭질은 그만 우울한거 모두 파란하늘에 묻어버려
	// 해당 스터디룸의 예약현황 
	@RequestMapping(value = "srResvInfo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num, ArrayList<SR_ReservationVO> srResvList, Model model) {
		srResvList = service.srResvInfo(studyroom_num);
		for (SR_ReservationVO vo : srResvList) {
			System.out.println("컨트롤러 srif: " + vo);
		}
		return srResvList;
	}
	
	// 스터디룸 예약 신청
	@RequestMapping(value = "resvApply", method = RequestMethod.GET)
	public String resvApply(String[] resvApplyArr, HttpSession session, String sysdate, ArrayList<SR_ReservationVO> myResvList, Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		int student_num = vo.getStudent_num(); // 세션의 학생번호
		service.resvApply(resvApplyArr, student_num); // 예약 신청 하기
		myResvList = service.myResvInfo(student_num); // 내 예약 현황 가져오기
		sysdate = service.getSysdate(); //  오늘 날짜 + 현재 시간 가져오기
		model.addAttribute("myResvList", myResvList);
		model.addAttribute("sysdate", sysdate);
		return "studyroom/myResvInfo";
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
		System.out.println(student_num);
		System.out.println("컨트롤러 취소 결과: " + cancelResult); // cancelMySRR()에서 null값이 넘어옴....
		myResvList = service.myResvInfoAll(student_num);
		
		sysdate = service.getSysdate();
		model.addAttribute("myResvList", myResvList);
		model.addAttribute("sysdate", sysdate);
		model.addAttribute("cancelResult", cancelResult);
		model.addAttribute("student_num", student_num);
		return "studyroom/myResvInfo";
	}
	
	// 스터디룸 예약 취소
	@RequestMapping(value = "cancelMySRR")
	public String cancelMySRR(String checkList, int student_num, Model model, HttpSession session) {
		boolean cancelResult = service.cancelMySRR(checkList); // 예약취소
		model.addAttribute(cancelResult);
		model.addAttribute(student_num);
		return "forward:myResvInfoPage";
	}
	
	// 시간대별 에약가능현황 조회
	@RequestMapping(value = "checkAvailableRoom", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Integer> checkAvailableRoom(String checkList, ArrayList<Integer> availableRoomList,
											@RequestParam(value="checkList[]") ArrayList<Integer> checkListList) {
		for (Integer cc : checkListList) {
			System.out.println("체크리스트: " + cc);
		}
		availableRoomList = service.checkAvailableRoom(checkListList);
		
		for (Integer vo : availableRoomList) {
			System.out.println("가능리스트: " + vo);
		}
		return availableRoomList;
	}
	
	// 현시점 에약가능현황 조회
	@RequestMapping(value = "nowAvailableRoom", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Integer> nowAvailableRoom(ArrayList<Integer> nowAvailableRoomList) {
		System.out.println("controller nowavailable");
		nowAvailableRoomList = service.nowAvailableRoom();
		
		for (Integer vo : nowAvailableRoomList) {
			System.out.println("now: " +vo);
		}
		
		return nowAvailableRoomList;
	}
	
}

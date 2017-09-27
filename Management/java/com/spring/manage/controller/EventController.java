package com.spring.manage.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.EventService;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.MemberVO;

@Controller
@RequestMapping("/myPage")
public class EventController {//
	
	@Autowired
	private EventService service;
	
	// 테스트 페이지로 이동
	@RequestMapping(value = "testPage", method = RequestMethod.GET)
	public String testPage(Model model, HttpSession session) {
		System.out.println(service.getSysdate());
		model.addAttribute("sysdate", service.getSysdate()); 
		// 세션 가져오기 (학번)
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		int student_num = vo.getStudent_num(); // 세션의 학생번호
		model.addAttribute("student_num", student_num);
		model.addAttribute("vo", vo);
		
		return "myPage/testPage";
	}
	
	// 마이 페이지로 이동
	@RequestMapping(value = "mySchedule", method = RequestMethod.GET)
	public String mySchedule(Model model, HttpSession session) {
		System.out.println("컨트롤러 달력페이지로 이동");
		model.addAttribute("sysdate", service.getSysdate()); 
		// 세션 가져오기 (학번)
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		int student_num = vo.getStudent_num(); // 세션의 학생번호
		
		model.addAttribute("student_num", student_num);
		model.addAttribute("vo", vo);
		
		return "myPage/mySchedule";
	}
	
	// 이벤트 가져오기
	@RequestMapping(value = "getEvent", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<EventVO> getEvent(int student_num) {
		return service.getEvent(student_num);
	}
	
	// 이벤트 등록하기
	@RequestMapping(value = "addEvent", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<EventVO> addEvent(int student_num, String title, String memo, String start, String end, 	//String
						@RequestParam(value="constraint", defaultValue="0") int constraint, 
						@RequestParam(value="backgroundColor", defaultValue="") String backgroundColor, 
						@RequestParam(value="reference", defaultValue="") String reference, 
						EventVO vo) { // 
		System.out.println("컨트롤러 들어와라");
		System.out.println("컨트롤러: " + start);
		System.out.println("컨트롤러 constraint: " + constraint);
		System.out.println("컨트롤러 reference: " + reference );
		System.out.println("컨트롤러 backgroundColor: " + backgroundColor);
			vo.setStudent_num(student_num);
			vo.setTitle(title);
			vo.setMemo(memo);
			vo.setStart(start);
			vo.setEnd(end);
			vo.setConstraint(constraint);
			vo.setBackgroundColor(backgroundColor);
			vo.setReference(reference);
			
//		String result = service.addEvent(vo);
		
//		return "redirect:mySchedule";
		return service.addEvent(vo);
	}
	
	// 이벤트 등록하기
	@RequestMapping(value = "modifyEvent", method = RequestMethod.POST)
	public String modifyEvent(int student_num, String title, String memo, String start, String end, 
						@RequestParam(value="constraint", defaultValue="0") int constraint, 
						@RequestParam(value="backgroundColor", defaultValue="") String backgroundColor, 
						@RequestParam(value="reference", defaultValue="") String reference, 
						@RequestParam(value="id", defaultValue="") String id, 
						EventVO vo) { // 
		System.out.println("컨트롤러 수정");
		System.out.println("컨트롤러 아이디: " + id);
		System.out.println("컨트롤러 제목: " + title);
		System.out.println("컨트롤러 메모: " + memo);
		System.out.println("컨트롤러 시작: " + start);
		System.out.println("컨트롤러 끝: " + end);
		System.out.println("컨트롤러 기수: " + constraint);
		System.out.println("컨트롤러 색상: " + backgroundColor);
		System.out.println("컨트롤러 참조: " + reference);
			vo.setStudent_num(student_num);
			vo.setTitle(title);
			vo.setMemo(memo);
			vo.setStart(start);
			vo.setEnd(end);
			vo.setConstraint(constraint);
			vo.setBackgroundColor(backgroundColor);
			vo.setReference(reference);
			vo.setId(id);
			
		String result = service.modifyEvent(vo);
		System.out.println("수정 결과: " + result);
		
		return "redirect:mySchedule";
	}
	
	// 이벤트 삭제하기
	@RequestMapping(value = "deleteEvent", method = RequestMethod.GET)
	public String deleteEvent(String id, int student_num, EventVO vo) {
		System.out.println("컨트롤러: 이벤트 삭제");
		System.out.println("아이디: " + id);
		System.out.println("학번: " + student_num);
		
		vo.setId(id);
		vo.setStudent_num(student_num);
		String result = service.deleteEvent(vo);
		System.out.println("삭제 결과: " + result);
		
		return "redirect:mySchedule";
	}
	
	// 드래그로 이벤트 날짜 수정하기
	@RequestMapping(value = "modifyEventDrag", method = RequestMethod.POST)
	@ResponseBody
	public String modifyEventDate(@RequestParam(value="start", defaultValue="") String start, 
									String end, String id, int student_num, EventVO vo) { // 
		System.out.println("컨트롤러 드래그로 수정하기");
		System.out.println("컨트롤러 id: " + id);
		System.out.println("컨트롤러 start: " + start);
		System.out.println("컨트롤러 end: " + end);
		System.out.println("컨트롤러 학번: " + student_num);
		if (start.equals("")) vo.setStart(""); // eventResize의 경우에는 수정된 시작 시간이 없다!
		else vo.setStart(start);
		
		vo.setEnd(end);
		vo.setId(id);
		vo.setStudent_num(student_num);
			
		return service.modifyEventDrag(vo);
	}
	
	// 리사이즈로 이벤트 날짜 수정하기
//	@RequestMapping(value = "resizeEventDrag", method = RequestMethod.POST)
//	@ResponseBody
//	public String resizeEventDrag(String end, String id, int student_num, EventVO vo) { // 
//		System.out.println("컨트롤러 리사이즈로 수정하기");
//		System.out.println("컨트롤러 id: " + id);
//		System.out.println("컨트롤러 end: " + end);
//		System.out.println("컨트롤러 학번: " + student_num);
//			vo.setEnd(end);
//			vo.setId(id);
//			vo.setStudent_num(student_num);
//			
//		return service.resizeEventDrag(vo);
//	}
	
}

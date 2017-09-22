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
	
	// 마이 페이지로 이동
	@RequestMapping(value = "mySchedule", method = RequestMethod.GET)
	public String mySchedule(Model model, HttpSession session) {
		System.out.println(service.getSysdate());
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
	public String addEvent(int student_num, String title, String memo, String start, String end, 
						@RequestParam(value="constraint", defaultValue="0") int constraint, 
						@RequestParam(value="backgroundColor", defaultValue="") String backgroundColor, 
						@RequestParam(value="source", defaultValue="") String source, 
						EventVO vo) { // 
		System.out.println("컨트롤러 들어와라");
		System.out.println("컨트롤러: " + start);
			vo.setStudent_num(student_num);
			vo.setTitle(title);
			vo.setMemo(memo);
			vo.setStart(start);
			vo.setEnd(end);
			vo.setConstraint(constraint);
			vo.setBackgroundColor(backgroundColor);
			vo.setSource(source);
			
		String result = service.addEvent(vo);
		
		return "redirect:mySchedule";
	}
}

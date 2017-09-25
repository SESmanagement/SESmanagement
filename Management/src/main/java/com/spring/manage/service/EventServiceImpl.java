package com.spring.manage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.EventDAO;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO dao;

	// 캘린더-이벤트 가지고 오기
	@Override
	public ArrayList<EventVO> getEvent(int student_num) {
		ArrayList<EventVO> eventList = dao.getEvent(student_num);
		
		for (EventVO vo : eventList) {
			String originalTitle = vo.getTitle();
//			if (vo.getSource() != null && vo.getSource().contains("SRR")) {
			if (vo.getMemo().length() <= 5) {
				vo.setTitle(originalTitle+":"+vo.getMemo()); // 달력에 title + memo 표시 //달력에 스터디룸  + 스터디룸번호-좌석번호 표시
			} else vo.setTitle(originalTitle+":"+vo.getMemo().substring(0, 5));
//			} 
//				System.out.println("서비스임플-allday: " + vo.isAllDay());
//				System.out.println("서비스임플-editable: " + vo.isEditable());
//			System.out.println("서비스임플-resourceEdi: " + vo.isResourceEditable());
		}
		return eventList;
	}

	@Override
	public String getSysdate() {
		return dao.getSysdate();
	}

	@Override
	public ArrayList<EventVO> addEvent(EventVO vo) {
		if (vo.getConstraint() == 33) {
			vo.setBackgroundColor("#f48342");
			vo.setClassName("");
			
		} else if (vo.getConstraint() == 34) {
			vo.setBackgroundColor("#41f1f4");
			vo.setClassName("");
			
		} else if (vo.getConstraint() == 99) {
			vo.setBackgroundColor("#7405ba");
			vo.setClassName("");
			
		} else vo.setClassName("draggable");
		
		String start_time = vo.getStart().substring(11);
		String end_time = vo.getEnd().substring(11);
		if (start_time.equals("00:00:00") && end_time.equals("00:00:00")) {
			vo.setAllDay(true);
		} else vo.setAllDay(false);

		
		if (dao.addEvent(vo) == 1) { //			return "true";
			return dao.getEvent(vo.getStudent_num());
		}
		else return null; //"false";
		
//		return dao.addEvent(vo);
	}

	@Override
	public String modifyEvent(EventVO vo) {
			if (vo.getConstraint() == 33) {
				vo.setBackgroundColor("#f48342");
				vo.setClassName("");
				
			} else if (vo.getConstraint() == 34) {
				vo.setBackgroundColor("#41f1f4");
				vo.setClassName("");
				
			} else if (vo.getConstraint() == 99) {
				vo.setBackgroundColor("#7405ba");
				vo.setClassName("");
				
			} else vo.setClassName("draggable");
	
		
		String start_time = vo.getStart().substring(11);
		String end_time = vo.getEnd().substring(11);
		if (start_time.equals("00:00:00") && end_time.equals("00:00:00")) {
			vo.setAllDay(true);
		} else vo.setAllDay(false);

		System.out.println("서비스임플 아이디: " + vo.getId());
		System.out.println("수정 갯수: " +  dao.modifyEvent(vo));
		if (dao.modifyEvent(vo) == 1) return "true";
		else return "false";
		
	}

	@Override
	public String deleteEvent(EventVO vo) {
		if (dao.deleteEvent(vo) == 1) return "true";
		else return "false";
	}

	@Override
	public String modifyEventDrag(EventVO vo) {
		if (dao.modifyEventDrag(vo) == 1) return "true";
		return "false";
	}

}

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
			if (vo.getSource() != null && vo.getSource().contains("SRR")) {
				vo.setTitle("스터디룸 : "+vo.getMemo()); // 달력에 스터디룸  + 스터디룸번호-좌석번호 표시
			}
		}
		return eventList;
	}

	@Override
	public String getSysdate() {
		return dao.getSysdate();
	}

	@Override
	public String addEvent(EventVO vo) {
		if (vo.getConstraint() == 33) {
			vo.setBackgroundColor("#f48342");
		} else if (vo.getConstraint() == 34) {
			vo.setBackgroundColor("#41f1f4");
		} else if (vo.getConstraint() == 99) {
			vo.setBackgroundColor("#7405ba");
		} else vo.setAllDay(true);
		
		if (dao.addEvent(vo) == 1) return "true";
		else return "false";
	}

}

package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.EventVO;

public interface EventService {

	// 캘린더-이벤트 가지고 오기
	public ArrayList<EventVO> getEvent(int student_num);

	// 캘린더 조회 시점의 현재 시각
	public String getSysdate();

	// 이벤트 등록하기
	public ArrayList<EventVO> addEvent(EventVO vo);
	
	// 이벤트 수정하기
	public String modifyEvent(EventVO vo);

	// 이벤트 삭제하기
	public String deleteEvent(EventVO vo);

	// 이벤트 일정 드래그로 수정하기
	public String modifyEventDrag(EventVO vo);


}

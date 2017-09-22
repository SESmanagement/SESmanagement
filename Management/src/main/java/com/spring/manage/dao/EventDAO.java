package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.StudyRoomVO;

public interface EventDAO { //

	// 캘린더-이벤트 가지고 오기
	public ArrayList<EventVO> getEvent(int student_num);

	// 캘린더 조회 시점의 현재 시각
	public String getSysdate();

	// 이벤트 등록하기
	public int addEvent(EventVO vo);


}

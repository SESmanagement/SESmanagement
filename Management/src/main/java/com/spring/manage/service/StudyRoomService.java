package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomService {

	// 마우스 오버시 해당 스터디룸(studyroom_num) 예약현황 팝업창 띄우기
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);

}

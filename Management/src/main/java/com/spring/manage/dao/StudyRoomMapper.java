package com.spring.manage.dao;

import java.util.ArrayList;

import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomMapper {

	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);

}

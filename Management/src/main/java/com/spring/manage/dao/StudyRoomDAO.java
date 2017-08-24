package com.spring.manage.dao;

import java.util.ArrayList;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomDAO {

	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);

	// 해당 스터디룸의 예약현황 조회
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num);

	// 예약현황 조회시점의 시각 조회
	public String getSysdate();

}

package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomService {

	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);
	
	// STUDYROOM 테이블의 SEATED_STATUS(예약건수) 초기화
	public void updateSeated_status();
	
	// 해당 스터디룸의 예약현황 조회
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num);

	// 예약현황 조회시점의 시각 조회
	public String getSysdate();

	// 스터디룸 예약 신청
	public void resvApply(String[] resvApplyArr, int student_num);

	// 나의 오늘자 스터디룸 예약현황 조회
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num);

	// 내 스터디룸 예약현황 페이지로 이동
	public ArrayList<SR_ReservationVO> myResvInfoAll(int student_num);

	// 스터디룸 예약 취소
	public boolean cancelMySRR(String checkList);

	// 시간대별 예약가능현황 조회
	public ArrayList<Integer> checkAvailableRoom(ArrayList<Integer> checkListList);

	// 현시점 에약가능현황 조회
	public ArrayList<Integer> nowAvailableRoom();

}

package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomMapper {

	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);
	
	// 스터디룸 예약신청후 테이블의  SEATED_STATUS에 상태 변경하기 => 카운트 가감(-/+) 
	public void updateSeated_status();

	// 해당 스터디룸의 예약현황 조회
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num);

	// 예약현황 조회시점의 시각 조회
	public String getSysdate();

	// 스터디룸 예약
	public void resvApply(SR_ReservationVO resvVO);

	// 내 예약 현황 조회
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num);

	// 내 스터디룸 예약현황 페이지로 이동
	public ArrayList<SR_ReservationVO> myResvInfoAll(int student_num);

	// 스터디룸 예약 취소
	public int cancelMySRR(String sr_resv_num);
	
	// 스터디룸 예약번호로 조회한 예약 내역 (예약 취소 실패시 백업용)
	public SR_ReservationVO getResvInfoBysr_resv_num(String sr_resv_num);

	// 스터디룸 예약 재신청 (예약 취소 실패시 백업용)
	public void resvApplyAgain(SR_ReservationVO resvVO);

	// 시간대별 에약가능현황 조회
	public ArrayList<Integer> checkAvailableRoom(ArrayList<Integer> checkListList);

	// 현시점 에약가능현황 조회
	public ArrayList<Integer> nowAvailableRoom();


}

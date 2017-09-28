package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomMapper { //

	// top메뉴 ->스터디룸 현황조회(top-스터디룸 예약-메뉴 포함)로 이동
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);
	
	// 스터디룸 예약신청후 테이블의  SEATED_STATUS에 상태 변경하기 => 카운트 가감(-/+) 
	public void updateSeated_status();

	// 해당 스터디룸의 예약현황 조회
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num);

	// 예약현황 조회시점의 시각 조회
	public String getSysdate();

	// 스터디룸 예약
	public void resvApply(SR_ReservationVO resvVO); // String
	
	// 캘린더 - 예약 완료건 EVENT 테이블에 insert
	public void addEvent(SR_ReservationVO resvVO);

	// 내 예약 현황 조회
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num);

	// 내 스터디룸 예약현황 페이지로 이동
	public ArrayList<SR_ReservationVO> myResvInfoAll(int student_num);

	// 스터디룸 예약 취소
	public int cancelMySRR(String sr_resv_num);
	
	// 캘린더 - 예약 취소건 EVENT 테이블에 delete
	public void deleteEvent(String sr_resv_num);
	
	// 스터디룸 예약번호로 조회한 예약 내역 (예약 취소 실패시 백업용)
	public SR_ReservationVO getResvInfoBysr_resv_num(String sr_resv_num);

	// 스터디룸 예약 재신청 (예약 취소 실패시 백업용)
	public void resvApplyAgain(SR_ReservationVO resvVO);

	// 시간대별 에약가능현황 조회
	public ArrayList<StudyRoomVO> checkAvailableRoom(ArrayList<Integer> checkListList);

	// 현시점 에약가능현황 조회
	public ArrayList<StudyRoomVO> nowAvailableRoom(String now_time);

	// 관리자 메뉴- 현재 DB에 저장되어 있는 스터디룸 정보 가져오기
	public ArrayList<StudyRoomVO> getStudyRoomLocation();

	// 관리자 메뉴- 현재 DB-SR_Facility에 저장되어 있는 해당 스터디룸의 부대시설정보 가져오기
	public ArrayList<SR_FacilityVO> getSRFacilityInfo(int studyroom_num);

	// 관리자 메뉴- 스터디룸의 좌석 비활성화 처리하기
	public int inactivateSR_Seat(StudyRoomVO srVO);

	// 관리자 메뉴- 스터디룸의 부대시설 비활성화 처리하기
	public int inactivateFC_Facility(SR_FacilityVO fcVO);

	// 관리자 메뉴- 스터디룸의 부대시설 등록하기
	public int addFC_Facility(SR_FacilityVO fcVO);

	// 관리자 메뉴- 스터디룸의 좌석 등록하기
	public int addSR_Seat(StudyRoomVO srVO);

	// 관리자 메뉴 - 스터디룸의 등록 좌석번호 중복 여부 확인
	public StudyRoomVO checkSeat_num(StudyRoomVO srVO);

	// 관리자 메뉴- 스터디룸의 부대시설 등록하기
	public int dropFC_Facility(SR_FacilityVO fcVO);

	// 관리자 메뉴- 스터디룸의 좌석 삭제하기
	public int dropSR_Seat(StudyRoomVO srVO);

	// 관리자 메뉴- 스터디룸 내 전좌석 비활성화 처리하기
	public int inactivateSR(StudyRoomVO srVO);

	// 관리자 메뉴- 스터디룸 내 전부대시설 비활성화 처리하기
	public int inactivateFC(SR_FacilityVO fcVO);

	// 관리자 메뉴 - 스터디룸 등록하기
	public int addSR(StudyRoomVO srVO);

	// 관리자 메뉴 - 스터디룸 삭제하기 - 부대시설 삭제하기
	public void dropFC(SR_FacilityVO fcVO);

	// 관리자 메뉴 - 스터디룸 삭제하기
	public int dropSR(StudyRoomVO srVO);

	// 관리자 메뉴-예약 내역 조회하기
	public ArrayList<SR_ReservationVO> getResvList(HashMap map, RowBounds rb);

	// 관리자 메뉴-조회된 예약 내역 전체 수 가져오기
	public int getTotal(HashMap map);

}

package com.spring.manage.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.util.PageNavigator2;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomService {//

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
	public ArrayList<StudyRoomVO> checkAvailableRoom(ArrayList<Integer> checkListList);

	// 현시점 에약가능현황 조회
	public ArrayList<StudyRoomVO> nowAvailableRoom(String now_time);

	// 관리자 메뉴- 현재 DB에 저장되어 있는 스터디룸 정보 가져오기
	public ArrayList<StudyRoomVO> getStudyRoomLocation();

	// 관리자 메뉴- 현재 DB-SR_Facility에 저장되어 있는 스터디룸의 부대시설정보 가져오기
	public ArrayList<SR_FacilityVO> getSRFacilityInfo(int studyroom_num);

	// 관리자 메뉴- 스터디룸의 좌석 비활성화 하기
	public boolean inactivateSR_Seat(String selectedList);

	// 관리자 메뉴- 스터디룸의 좌석 / 부대 시설 등록하기
	public String addSR_Seat(String selectedList);

	// 관리자 메뉴- 스터디룸의 좌석 / 부대 시설 삭제하기
	public String dropSR_Seat(String selectedList);

	// 관리자 메뉴- 스터디룸 비활성화 하기
	public boolean inactivateSR(String selectedList);

	// 관리자 메뉴 - 스터디룸 등록하기
	public String addSR(String selectedList);

	// 관리자 메뉴 - 스터디룸 삭제하기
	public String dropSR(String selectedList);

	// 관리자 메뉴-예약 내역 조회하기
	public HashMap<String, Object> getResvList(ArrayList<String> studyroom_checkList,
			ArrayList<String> date_checkList, ArrayList<String> etc_checkList, int currentPage);

//	// 관리자 메뉴 - 예약 내역 조회 결과 페이징
//	public PageNavigator getNavi(ArrayList<String> studyroom_checkList,
//			ArrayList<String> date_checkList, ArrayList<String> etc_checkList, int currentPage);
	
	// 캘린더-이벤트 가지고 오기
	public ArrayList<EventVO> getEvent(int student_num);

}

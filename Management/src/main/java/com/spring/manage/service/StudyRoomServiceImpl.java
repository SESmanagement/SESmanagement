package com.spring.manage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.StudyRoomDAO;
import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService {

	@Autowired
	private StudyRoomDAO dao;

	@Override
	public ArrayList<StudyRoomVO> showInside(int studyroom_num) {
		return dao.showInside(studyroom_num);
	}
	
	@Override
	public void updateSeated_status() {
		dao.updateSeated_status();
	}
	
	@Override
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num) {
		ArrayList<SR_ReservationVO> srrList = dao.srResvInfo(studyroom_num);
		
		// 시작/종료시간 중 시간만 가지고 오기
		for (SR_ReservationVO srrVO : srrList) {
			String[] start_time_array = srrVO.getStart_time().split(" ");
			srrVO.setStart_time(start_time_array[1]);
			String[] end_time_array = srrVO.getEnd_time().split(" ");
			srrVO.setEnd_time(end_time_array[1]);
		}
		
		return srrList;
	}

	// 예약현황 조회시점의 시각 조회
	@Override
	public String getSysdate() {
		String sysdate = dao.getSysdate();
		return sysdate;
	}

	@Override
	public void resvApply(String[] resvApplyArr, int student_num) {
		List<SR_ReservationVO> resvList = new ArrayList<>();
		for (String resv : resvApplyArr) {
			// 스터디룸 넘버 / 좌석 번호 / 시작시간
			// 1:1:time1,      1:1:time3,    1:1:time2,     1:1:time4
			SR_ReservationVO resvVO = new SR_ReservationVO();
			String[] resvEachApply = resv.split(":");
			
			resvVO.setStudent_num(student_num); // 학생번호
			resvVO.setStudyroom_num(Integer.parseInt(resvEachApply[0])); // 스터디룸 번호
			resvVO.setSr_seat_num(Integer.parseInt(resvEachApply[1]));   // 좌석 번호
			
			// 예약 시작시간, 종료시간
			if (resvEachApply[2].equals("time1")) {
				resvVO.setStart_time("19:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("20:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				
			} else if (resvEachApply[2].equals("time2")) {
				resvVO.setStart_time("20:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("21:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				
			} else if (resvEachApply[2].equals("time3")) {
				resvVO.setStart_time("21:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("22:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				
			} else if (resvEachApply[2].equals("time4")) {
				resvVO.setStart_time("22:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("23:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
			}
			
			// 배열 수만큼 예약 처리
			dao.resvApply(resvVO);
		} // for
	}

	@Override
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num) {
		return dao.myResvInfo(student_num);
	}

	@Override
	public ArrayList<SR_ReservationVO> myResvInfoAll(int student_num) {
		return dao.myResvInfoAll(student_num);
	}

	@Override
	public boolean cancelMySRR(String checkList) {
		String[] checkListArray = checkList.split(",");
		String[] resultArray = new String[checkListArray.length];
		
		// 배열 수만큼 예약 취소 처리
		for (int i = 0; i < checkListArray.length; i++) {
			String sr_resv_num = checkListArray[i];
			// 취소할 예약 정보 (취소 처리 실패시 백업용)
			SR_ReservationVO resvVO = dao.getResvInfoBysr_resv_num(sr_resv_num);
			
			if (dao.cancelMySRR(sr_resv_num, resvVO) != 1) {
				dao.resvApplyAgain(resvVO);
				return false;
			}
		}
		
		return true;
	}

	@Override
	public ArrayList<Integer> checkAvailableRoom(ArrayList<Integer> checkListList) {
		ArrayList<Integer> resultList = new ArrayList<>(); // 최종 에약가능한 스터디룸 번호 모음
		resultList = dao.checkAvailableRoom(checkListList);
		return resultList; 
	}

	@Override
	public ArrayList<Integer> nowAvailableRoom() {
		return dao.nowAvailableRoom();
	}

}

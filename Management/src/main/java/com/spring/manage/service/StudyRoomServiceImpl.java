package com.spring.manage.service;

import java.util.ArrayList;

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
	
}

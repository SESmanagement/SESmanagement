package com.spring.manage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.ArrangeDAO;
import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

@Service
public class ArrangeServiceImpl implements ArrangeService{

	@Autowired
	private ArrangeDAO dao;
	
	@Override
	public ArrayList<ClassRoomVO> getClassRoom() {
		return dao.getClassRoom();
	}

	@Override
	public ArrayList<PartyVO> getPartyList() {
		return dao.getPartyList();
	}

	@Override
	public void updateRoom(ClassRoomVO room) {

		//강의실 정보 입력
		dao.updateRoom(room);	
	
		//강의실 상태 업데이트
		
		//강의실 좌석 전체 갯수
		int totalSeat = room.getHeight() * room.getWidth();
		
		//해당 강의실 상태 초기화
		dao.deleteSeat(room);
		
		//해당 강의실 상태 좌석값 입력
		Room_StatusVO status = new Room_StatusVO();
		for(int i = 0 ; i < totalSeat ; i++){
			status.setClassRoom_num(room.getNum());
			status.setSeat(i);
			status.setServiceable(0);
			dao.insertSeat(status);		
		}
		
		


	}

}

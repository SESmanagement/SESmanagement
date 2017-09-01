package com.spring.manage.service;

import java.util.ArrayList;

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
	public void updateRoom(ClassRoomVO room, ArrayList<Room_StatusVO> statusList) {
		//강의실 정보 입력
		dao.updateRoom(room);
		for(Room_StatusVO status : statusList){
			dao.insertSeat(status);
		}
		
	}

	@Override
	public void insertSeat(ArrayList<Room_StatusVO> statusList) {
		for(Room_StatusVO status : statusList){
			dao.insertSeat(status);
		}
		
	}

}

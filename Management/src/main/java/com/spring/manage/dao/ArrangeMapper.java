package com.spring.manage.dao;

import java.util.ArrayList;

import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

public interface ArrangeMapper {
	public ArrayList<ClassRoomVO> getClassRoom();
	public ArrayList<PartyVO> getPartyList();
	public void updateRoom(ClassRoomVO room);
	public void deleteSeat();
	public void insertSeat(Room_StatusVO status);
}

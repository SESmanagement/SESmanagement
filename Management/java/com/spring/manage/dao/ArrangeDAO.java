package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

public interface ArrangeDAO {

	public ArrayList<ClassRoomVO> getClassRoom();
	public ArrayList<PartyVO> getPartyList();
	public void updateRoom(ClassRoomVO room);
	public int deleteSeat(ClassRoomVO room);
//	public void insertSeat(List<Room_StatusVO> status);
	public void insertSeat(Room_StatusVO status);
}

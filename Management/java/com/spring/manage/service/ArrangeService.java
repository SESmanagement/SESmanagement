package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.ArrangeVO;
import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

public interface ArrangeService {
	public ArrayList<ClassRoomVO> getClassRoom();
	public ArrayList<PartyVO> getPartyList();
	public void updateRoom(ClassRoomVO room);
	public ArrayList<Room_StatusVO> getRoom_Status(int classRoom_num);
	public ClassRoomVO selectRoom(int num);
	public ArrayList<Room_StatusVO> changeServiceAble(Room_StatusVO status); 
	public ArrayList<ClassRoomVO> callRooms(int num);
	public int countPartyMember(int party_num);
	public ArrayList<ArrangeVO> ArrangeClass(int party_num);
}

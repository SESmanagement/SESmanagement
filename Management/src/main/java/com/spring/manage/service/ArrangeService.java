package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

public interface ArrangeService {
	public ArrayList<ClassRoomVO> getClassRoom();
	public ArrayList<PartyVO> getPartyList();
	public void updateRoom(ClassRoomVO room);

}

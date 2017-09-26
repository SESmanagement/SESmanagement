package com.spring.manage.dao;

import java.util.ArrayList;

import com.spring.manage.vo.ArrangeVO;
import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

public interface ArrangeMapper {
	public ArrayList<ClassRoomVO> getClassRoom();
	public ArrayList<PartyVO> getPartyList();
	public void updateRoom(ClassRoomVO room);
	public int deleteSeat(ClassRoomVO room);
	public void insertSeat(Room_StatusVO status);
	public ArrayList<Room_StatusVO> getRoom_Status(int classRoom_num);
	public ClassRoomVO selectRoom(int num);
	public int changeServiceAble(Room_StatusVO status); 
	public ArrayList<ClassRoomVO> callRooms(int num);
	public int countPartyMember(int party_num);
	public ArrayList<MemberVO> callMember(int party_num);
	public ArrayList<Exam_ScoreVO> callScore();
	public ArrayList<Member_NoteVO> callNote();
	public int countService(int classroom_num);
	public void arrangeClass(ArrangeVO member);

}

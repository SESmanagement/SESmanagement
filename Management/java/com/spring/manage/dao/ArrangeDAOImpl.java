package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.ArrangeVO;
import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

@Repository
public class ArrangeDAOImpl implements ArrangeDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<ClassRoomVO> getClassRoom() {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.getClassRoom();
	}
	
	//강의실 정보 목록
	//기수 정보 목록
	@Override
	public ArrayList<PartyVO> getPartyList() {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.getPartyList();
	}
	
	//강의실 정보 수정
	@Override
	public void updateRoom(ClassRoomVO room) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		mapper.updateRoom(room);
	}

	//강의실 좌석 삭제
	@Override
	public int deleteSeat(ClassRoomVO room) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		System.out.println("asdfasdf");
		System.out.println("hello : "+room);
		return mapper.deleteSeat(room);
		
	}

	@Override
	public void insertSeat(Room_StatusVO status) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		mapper.insertSeat(status);
		
	}

	@Override
	public ArrayList<Room_StatusVO> getRoom_Status(int num) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.getRoom_Status(num);
	}

	@Override
	public ClassRoomVO selectRoom(int classRoom_num) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.selectRoom(classRoom_num);
	}

	@Override
	public int changeServiceAble(Room_StatusVO status) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		System.out.println("여기까지 옴? 여긴 : DAO");
		return mapper.changeServiceAble(status);
		
	}

	@Override
	public ArrayList<ClassRoomVO> callRooms(int num) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.callRooms(num);
	}

	@Override
	public int countPartyMember(int party_num) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.countPartyMember(party_num);
	}

	@Override
	public ArrayList<MemberVO> callMember(int party_num) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.callMember(party_num);
	}

	@Override
	public ArrayList<Exam_ScoreVO> callScore() {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.callScore();
	}

	@Override
	public ArrayList<Member_NoteVO> callNote() {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.callNote();
	}

	@Override
	public int countService(int classroom_num) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		return mapper.countService(classroom_num);
	}

	@Override
	public void arrangeClass(ArrangeVO member) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		mapper.arrangeClass(member);
	}

	

	
}

package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.ClassRoomVO;
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

	//강의실에 좌석 입력
	//@Override
	/*public void insertSeat(List<Room_StatusVO> status) {
		ArrangeMapper mapper = sqlSession.getMapper(ArrangeMapper.class);
		Map<String, List<Room_StatusVO>> statusList = new HashMap<>(); 
		statusList.put("list", status);
		for(Room_StatusVO vo : status){
			System.out.println(vo);
		}
		mapper.insertSeat(statusList);
		for(int i = 0 ; i < statusList.size(); i++){
			System.out.println(statusList.get(i));
			mapper.insertSeat(statusList.get(i));
		}
	}*/

	
}

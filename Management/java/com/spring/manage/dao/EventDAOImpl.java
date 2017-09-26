package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.StudyRoomVO;

@Repository
public class EventDAOImpl implements EventDAO { //
	
	@Autowired
	private SqlSession sqlSession;
	private EventMapper mapper;
	
	@Override
	public ArrayList<EventVO> getEvent(int student_num) {
		mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.getEvent(student_num);
	}

	@Override
	public String getSysdate() {
		mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.getSysdate();
	}

	@Override
	public int addEvent(EventVO vo) {
		mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.addEvent(vo);
	}

	@Override
	public int modifyEvent(EventVO vo) {
		mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.modifyEvent(vo);
	}

	@Override
	public int deleteEvent(EventVO vo) {
		mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.deleteEvent(vo);
	}

	@Override
	public int modifyEventDrag(EventVO vo) {
		mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.modifyEventDrag(vo);
	}

}

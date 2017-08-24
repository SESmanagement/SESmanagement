package com.spring.manage.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

@Repository
public class StudyRoomDAOImpl implements StudyRoomDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private StudyRoomMapper mapper;
	
	@Override
	public ArrayList<StudyRoomVO> showInside(int studyroom_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.showInside(studyroom_num);
	}

	@Override
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.srResvInfo(studyroom_num);
	}

	@Override
	public String getSysdate() {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.getSysdate();
	}

}

package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;

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
	public void updateSeated_status() {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		mapper.updateSeated_status();
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

	@Override
	public void resvApply(SR_ReservationVO resvVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		mapper.resvApply(resvVO); // SR_RESERVATION
		mapper.updateSeated_status(); // STUDYROOM
	}

	@Override
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.myResvInfo(student_num);
	}

	@Override
	public ArrayList<SR_ReservationVO> myResvInfoAll(int student_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.myResvInfoAll(student_num);
	}

	@Override
	public int cancelMySRR(String sr_resv_num, SR_ReservationVO resvVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		int result = mapper.cancelMySRR(sr_resv_num); // SR_RESERVATION
		mapper.updateSeated_status(); // STUDYROOM
		return result;
	}

	@Override
	public SR_ReservationVO getResvInfoBysr_resv_num(String sr_resv_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.getResvInfoBysr_resv_num(sr_resv_num);
		
	}

	@Override
	public void resvApplyAgain(SR_ReservationVO resvVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		mapper.resvApplyAgain(resvVO);
		
	}

	@Override
	public ArrayList<Integer> checkAvailableRoom(ArrayList<Integer> checkListList) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.checkAvailableRoom(checkListList);
	}

	@Override
	public ArrayList<Integer> nowAvailableRoom() {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.nowAvailableRoom();
	}

}

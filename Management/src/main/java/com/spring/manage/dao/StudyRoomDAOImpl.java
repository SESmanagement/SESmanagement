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
		mapper.addEvent(resvVO); // EVENT
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
		mapper.deleteEvent(sr_resv_num);
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
		mapper.resvApplyAgain(resvVO); // SR_RESERVATION
		mapper.addEvent(resvVO); // EVENT
		
	}

	@Override
	public ArrayList<StudyRoomVO> checkAvailableRoom(ArrayList<Integer> checkListList) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.checkAvailableRoom(checkListList);
	}

	@Override
	public ArrayList<StudyRoomVO> nowAvailableRoom(String now_time) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.nowAvailableRoom(now_time);
	}

	@Override
	public ArrayList<StudyRoomVO> getStudyRoomLocation() {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.getStudyRoomLocation();
	}

	@Override
	public ArrayList<SR_FacilityVO> getSRFacilityInfo(int studyroom_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.getSRFacilityInfo(studyroom_num);
	}

	@Override
	public int inactivateSR_Seat(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.inactivateSR_Seat(srVO);
	}

	@Override
	public int inactivateFC_Facility(SR_FacilityVO fcVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.inactivateFC_Facility(fcVO);
	}

	@Override
	public int addFC_Facility(SR_FacilityVO fcVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.addFC_Facility(fcVO);
	}

	@Override
	public int addSR_Seat(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.addSR_Seat(srVO);
	}

	@Override
	public StudyRoomVO checkSeat_num(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.checkSeat_num(srVO);
	}

	@Override
	public int dropFC_Facility(SR_FacilityVO fcVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.dropFC_Facility(fcVO);
	}

	@Override
	public int dropSR_Seat(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.dropSR_Seat(srVO);
	}

	@Override
	public int inactivateSR(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.inactivateSR(srVO);
	}

	@Override
	public void inactivateFC(SR_FacilityVO fcVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		mapper.inactivateFC(fcVO);
	}

	@Override
	public int addSR(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.addSR(srVO);
	}

	@Override
	public void dropFC(SR_FacilityVO fcVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		mapper.dropFC(fcVO);
	}

	@Override
	public int dropSR(StudyRoomVO srVO) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.dropSR(srVO);
	}

	@Override
	public ArrayList<SR_ReservationVO> getResvList(HashMap map, int startRecord, int countPerPage) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		return mapper.getResvList(map, rb);
	}

	@Override
	public int getTotal(HashMap map) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.getTotal(map);
	}

	// 캘린더-이벤트 가지고 오기
	@Override
	public ArrayList<EventVO> getEvent(int student_num) {
		mapper = sqlSession.getMapper(StudyRoomMapper.class);
		return mapper.getEvent(student_num);
	}

}

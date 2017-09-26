package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;

@Repository
public class StudentDAOImpl implements StudentDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MemberVO> getStudentList(int party_num) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		return mapper.getStudentList(party_num);
	}

	@Override
	public MemberVO selectStudent(int student_num) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		return mapper.selectStudent(student_num);
	}

	@Override
	public ArrayList<MemberVO> selectHateStudent(MemberVO vo) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
	
			return mapper.selectHateStudent(vo);
	}

	@Override
	public void adviceInsert(Member_NoteVO target) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.adviceInsert(target);
	}

	@Override
	public void insertExamIt_1(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamIt_1(score);
	}

	@Override
	public void insertExamIt_2(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamIt_2(score);
		
	}

	@Override
	public void insertExamIt_3(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamIt_3(score);
		
	}

	@Override
	public void insertExamJap_1(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamJap_1(score);
		
	}

	@Override
	public void insertExamJap_2(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamJap_2(score);
		
	}

	@Override
	public void insertExamJap_3(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamJap_3(score);
		
	}

	@Override
	public void insertExamLive_Score(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.insertExamLive_Score(score);
		
	}

	@Override
	public Exam_ScoreVO getSelectExam_Score(Exam_ScoreVO score) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		return mapper.getSelectExam_Score(score);
	}

	@Override
	public void setSelectExam_Score(int student_num) {
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		mapper.setSelectExam_Score(student_num);
	}
	
	
	
	
	
}

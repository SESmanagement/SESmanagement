package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;


public interface StudentDAO {

	public ArrayList<MemberVO> getStudentList(int party_num);
	public MemberVO selectStudent(int student_num);
	public ArrayList<MemberVO> selectHateStudent(MemberVO vo);
	public void adviceInsert(Member_NoteVO target);
	
	public void insertExamIt_1(Exam_ScoreVO score);
	public void insertExamIt_2(Exam_ScoreVO score);
	public void insertExamIt_3(Exam_ScoreVO score);
	public void insertExamJap_1(Exam_ScoreVO score);
	public void insertExamJap_2(Exam_ScoreVO score);
	public void insertExamJap_3(Exam_ScoreVO score);
	public void insertExamLive_Score(Exam_ScoreVO score);
	
	public Exam_ScoreVO getSelectExam_Score(Exam_ScoreVO score);
	public void setSelectExam_Score(int student_num);
	
}

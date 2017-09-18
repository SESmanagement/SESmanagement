package com.spring.manage.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

public interface StudentService {
	public ArrayList<MemberVO> getStudentList(int party_num); 
	public MemberVO selectStudent(int party_num);
	public ArrayList<MemberVO> selectHateStudent(int party_num, String name);
	public void adviceInsert(Member_NoteVO target);
	public void insertExamTotal(String typeExam, List<Integer> examScoreArr, List<Integer> student_numArr);
	public Exam_ScoreVO getSelectExam_Score(Exam_ScoreVO score);
	public void setSelectExam_Score(int student_num);

}

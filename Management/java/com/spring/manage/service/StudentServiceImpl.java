package com.spring.manage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.StudentDAO;
import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDAO dao;

	@Override
	public ArrayList<MemberVO> getStudentList(int member_num) {
		return dao.getStudentList(member_num);
	}

	@Override
	public MemberVO selectStudent(int student_num) {
		return dao.selectStudent(student_num);
	}

	@Override
	public ArrayList<MemberVO> selectHateStudent(int member_num, String name) {
		MemberVO vo = new MemberVO();
		System.out.println(member_num);
		vo.setParty_num(member_num);
		vo.setName(name);
		return dao.selectHateStudent(vo);
	}

	@Override
	public void adviceInsert(Member_NoteVO target) {
		dao.adviceInsert(target);
		
	}

	@Override
	public void insertExamTotal(String typeExam, List<Integer> examScoreArr, List<Integer> student_numArr) {
		Exam_ScoreVO score = new Exam_ScoreVO();
		//List<Exam_ScoreVO> scoreList = new ArrayList<>();
		System.out.println("입력값 사이즈 : " + student_numArr.size());
		if (typeExam.equals("IT_1")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setIt_1(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				System.out.println(" 점수 : "+score.getIt_1() + " 학번 : " + score.getStudent_num());
				dao.insertExamIt_1(score);
				//scoreList.add(score);
			}
//			Exam_ScoreVO[] array = (Exam_ScoreVO[]) scoreList.toArray();
//			dao.insertExamIt_1(array);

		
		}else if(typeExam.equals("IT_2")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setIt_2(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				//scoreList.add(score);
				dao.insertExamIt_2(score);
			}
		
		}else if(typeExam.equals("IT_3")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setIt_3(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				//scoreList.add(score);
				dao.insertExamIt_3(score);
			}
		
		}else if(typeExam.equals("JAP_1")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setJap_1(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				//scoreList.add(score);
				dao.insertExamJap_1(score);
			}
		
		}else if(typeExam.equals("JAP_2")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setJap_2(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				//scoreList.add(score);
				dao.insertExamJap_2(score);
			}
		}else if(typeExam.equals("JAP_3")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setJap_3(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				//scoreList.add(score);
				dao.insertExamJap_3(score);
			}

		}else if(typeExam.equals("LIVE_SCORE")){
			for(int i = 0 ; i < student_numArr.size() ; i++){
				score.setJap_3(examScoreArr.get(i));
				score.setStudent_num(student_numArr.get(i));
				//scoreList.add(score);
				dao.insertExamLive_Score(score);
			}
		}
	
	}

	@Override
	public Exam_ScoreVO getSelectExam_Score(Exam_ScoreVO score) {		
		return dao.getSelectExam_Score(score);
	}

	@Override
	public void setSelectExam_Score(int student_num) {
		dao.setSelectExam_Score(student_num);
		
	}
	

}

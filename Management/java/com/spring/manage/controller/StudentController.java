package com.spring.manage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.StudentService;
import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;




@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService service;

	//학생관리 페이지로 이동
	@RequestMapping(value="/studentForm", method=RequestMethod.GET)
	public String studentForm(){
			
		return "/student/studentForm";
	}
	
	//학생 목록 뽑아오기
	@RequestMapping(value="/getStudentList", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<MemberVO> getStudentList(int party_num){
		System.out.println("Hello?");
		return service.getStudentList(party_num);
	}
	
	//학생 선택한거 가지고오기
	@RequestMapping(value="/selectStudent", method=RequestMethod.GET)
	@ResponseBody
	public MemberVO selectStudent(int student_num){		
		return service.selectStudent(student_num);
	}
	
	//불편한 학생 검색
	@RequestMapping(value="/selectHateStudent", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<MemberVO> selectHateStudent(int party_num, String name){	
		return service.selectHateStudent(party_num, name);
	}
	
	//	adviceInsert
	// 불편한 학생 입력
	@RequestMapping(value="/adviceInsert", method=RequestMethod.POST)
	@ResponseBody
	public void adviceInsert(Member_NoteVO target){	
		System.out.println("스튜던트컨트롤러:  "+target);
		service.adviceInsert(target);
		
	}
	
	//insertExamTotal
	//전체 성적 등록
	@RequestMapping(value="/insertExamTotal", method=RequestMethod.POST)
	@ResponseBody
	public void insertExamTotal(@RequestParam(value="typeExam") String typeExam, @RequestParam(value="examScoreArr[]") List<Integer> examScoreArr, @RequestParam(value="student_numArr[]") List<Integer> student_numArr){	
		System.out.println("시험종류 : "+ typeExam);
		service.insertExamTotal(typeExam, examScoreArr, student_numArr);
	}
	
	
	@RequestMapping(value="/getSelectExam_Score", method=RequestMethod.GET)
	@ResponseBody
	public Exam_ScoreVO getSelectExam_Score(Exam_ScoreVO score){
		return service.getSelectExam_Score(score);
	}
	
	@RequestMapping(value="/setSelectExam_Score", method=RequestMethod.GET)
	@ResponseBody
	public void setSelectExam_Score(int student_num){
		System.out.println(student_num);
		service.setSelectExam_Score(student_num);
	}
}
	
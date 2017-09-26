package com.spring.manage.vo;

public class Student_StatusVO {

//	STUDENT_NUM NUMBER PRIMARY KEY REFERENCES MEMBER(STUDENT_NUM),
//	STUDENT_NAME VARCHAR2(20) not null,
//	REASON VARCHAR2(100)
	
	private int student_num;
	private int student_name;
	private String reason;

	public Student_StatusVO() {}

	public Student_StatusVO(int student_num, int student_name, String reason) {
		this.student_num = student_num;
		this.student_name = student_name;
		this.reason = reason;
	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public int getStudent_name() {
		return student_name;
	}

	public void setStudent_name(int student_name) {
		this.student_name = student_name;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "Student_StatusVO [student_num=" + student_num + ", student_name=" + student_name + ", reason=" + reason
				+ "]";
	}
	
	
	
	
	
}

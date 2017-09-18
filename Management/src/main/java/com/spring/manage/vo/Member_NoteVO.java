package com.spring.manage.vo;

public class Member_NoteVO {

//	SERIAL_NUM NUMBER PRIMARY KEY,
//	ADVICE_DATE TIMESTAMP DEFAULT SYSDATE,
//	STUDENT_NUMBER NUMBER NOT NULL REFERENCES MEMBER(STUDENT_NUM), 
//	SPECIAL_NOTE VARCHAR2(3000),
//	HATE_STUDENT_NUM NUMBER REFERENCES MEMBER(STUDENT_NUM)

	private int serial_num;
	private String advice_date;
	private int student_number;
	private String special_note;
	private int hate_student_num;

	public Member_NoteVO() {}

	public Member_NoteVO(int serial_num, String advice_date, int student_number, String special_note,
			int hate_student_num) {
		super();
		this.serial_num = serial_num;
		this.advice_date = advice_date;
		this.student_number = student_number;
		this.special_note = special_note;
		this.hate_student_num = hate_student_num;
	}

	public int getSerial_num() {
		return serial_num;
	}

	public void setSerial_num(int serial_num) {
		this.serial_num = serial_num;
	}

	public String getAdvice_date() {
		return advice_date;
	}

	public void setAdvice_date(String advice_date) {
		this.advice_date = advice_date;
	}

	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}

	public String getSpecial_note() {
		return special_note;
	}

	public void setSpecial_note(String special_note) {
		this.special_note = special_note;
	}

	public int getHate_student_num() {
		return hate_student_num;
	}

	public void setHate_student_num(int hate_student_num) {
		this.hate_student_num = hate_student_num;
	}

	@Override
	public String toString() {
		return "Member_Note [serial_num=" + serial_num + ", advice_date=" + advice_date + ", student_number="
				+ student_number + ", special_note=" + special_note + ", hate_student_num=" + hate_student_num + "]";
	}
	
	
}

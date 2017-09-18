package com.spring.manage.vo;

public class Exam_ScoreVO {
//	STUDENT_NUM NUMBER PRIMARY KEY REFERENCES MEMBER(STUDENT_NUM),
//	IT_1 NUMBER,
//	IT_2 NUMBER,
//	IT_3 NUMBER,
//	JAP_1 NUMBER,
//	JAP_2 NUMBER,
//	JAP_3 NUMBER,
//	LIVE_SCORE NUMBER
	private int student_num;
	private int it_1;
	private int it_2;
	private int it_3;
	private int jap_1;
	private int jap_2;
	private int jap_3;
	private int live_score;

	public Exam_ScoreVO() {}

	public Exam_ScoreVO(int student_num, int it_1, int it_2, int it_3, int jap_1, int jap_2, int jap_3,
			int live_score) {
		super();
		this.student_num = student_num;
		this.it_1 = it_1;
		this.it_2 = it_2;
		this.it_3 = it_3;
		this.jap_1 = jap_1;
		this.jap_2 = jap_2;
		this.jap_3 = jap_3;
		this.live_score = live_score;
	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public int getIt_1() {
		return it_1;
	}

	public void setIt_1(int it_1) {
		this.it_1 = it_1;
	}

	public int getIt_2() {
		return it_2;
	}

	public void setIt_2(int it_2) {
		this.it_2 = it_2;
	}

	public int getIt_3() {
		return it_3;
	}

	public void setIt_3(int it_3) {
		this.it_3 = it_3;
	}

	public int getJap_1() {
		return jap_1;
	}

	public void setJap_1(int jap_1) {
		this.jap_1 = jap_1;
	}

	public int getJap_2() {
		return jap_2;
	}

	public void setJap_2(int jap_2) {
		this.jap_2 = jap_2;
	}

	public int getJap_3() {
		return jap_3;
	}

	public void setJap_3(int jap_3) {
		this.jap_3 = jap_3;
	}

	public int getLive_score() {
		return live_score;
	}

	public void setLive_score(int live_score) {
		this.live_score = live_score;
	}

	@Override
	public String toString() {
		return "Exam_ScoreVO [student_num=" + student_num + ", it_1=" + it_1 + ", it_2=" + it_2 + ", it_3=" + it_3
				+ ", jap_1=" + jap_1 + ", jap_2=" + jap_2 + ", jap_3=" + jap_3 + ", live_score=" + live_score + "]";
	}
	
	
	
	
}

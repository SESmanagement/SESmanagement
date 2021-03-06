package com.spring.manage.vo;

public class SR_ReservationVO { //
	private String sr_resv_num;	// 예약 일련번호
	private int studyroom_num; 	// 스터디룸 번호
	private int sr_seat_num; 	//  스터디룸 내 좌석 번호
	private int student_num; 	// 학생번호
	private String start_time; 	// 예약 시작시간
	private String end_time; 	// 예약 종료시간
	private String name;		// 학생 이름 (관리자 예약내역 조회시)
	private String member_num;	// 학생 기수 (관리자 예약내역 조회시)
	
	public SR_ReservationVO() {}

	public String getSr_resv_num() {
		return sr_resv_num;
	}

	public void setSr_resv_num(String sr_resv_num) {
		this.sr_resv_num = sr_resv_num;
	}

	public int getStudyroom_num() {
		return studyroom_num;
	}

	public void setStudyroom_num(int studyroom_num) {
		this.studyroom_num = studyroom_num;
	}

	public int getSr_seat_num() {
		return sr_seat_num;
	}

	public void setSr_seat_num(int sr_seat_num) {
		this.sr_seat_num = sr_seat_num;
	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getmember_num() {
		return member_num;
	}

	public void setmember_num(String member_num) {
		this.member_num = member_num;
	}

	@Override
	public String toString() {
		return "SR_ReservationVO [sr_resv_num=" + sr_resv_num + ", studyroom_num=" + studyroom_num + ", sr_seat_num="
				+ sr_seat_num + ", student_num=" + student_num + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", name=" + name + ", member_num=" + member_num + "]";
	}

}

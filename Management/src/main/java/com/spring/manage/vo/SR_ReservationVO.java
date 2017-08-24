package com.spring.manage.vo;

public class SR_ReservationVO {
	private String sr_resv_num; // 예약 일련번호
	private int studyroom_num; // 스터디룸 번호
	private int sr_seat_num; //  스터디룸 내 좌석 번호
	private String start_time; // 에약 시작시간
	private String end_time; // 에약 종료시간
	
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

	@Override
	public String toString() {
		return "SR_ReservationVO [sr_resv_num=" + sr_resv_num + ", studyroom_num=" + studyroom_num + ", sr_seat_num="
				+ sr_seat_num + ", start_time=" + start_time + ", end_time=" + end_time + "]";
	}
	
}

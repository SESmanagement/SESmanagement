package com.spring.manage.vo;

public class StudyRoomVO {
	private int studyroom_num; // 스터디룸 번호
	private int sr_seat_num; // 각 스터디룸 내 좌석 번호
	private char rechargable; // 충전가능여부 (좌석 근처에 콘세트 유무 여부를 Y와 N으로 표시)
	private String seated_status; // 현재 좌석 배치 현황 (예약중 / 예약가능 / 예약불가-관리자 처리)
	
	public StudyRoomVO() {}

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

	public char getRechargable() {
		return rechargable;
	}

	public void setRechargable(char rechargable) {
		this.rechargable = rechargable;
	}

	public String getSeated_status() {
		return seated_status;
	}

	public void setSeated_status(String seated_status) {
		this.seated_status = seated_status;
	}

	@Override
	public String toString() {
		return "StudyRoomVO [studyroom_num=" + studyroom_num + ", sr_seat_num=" + sr_seat_num + ", rechargable="
				+ rechargable + ", seated_status=" + seated_status + "]";
	}
	
}

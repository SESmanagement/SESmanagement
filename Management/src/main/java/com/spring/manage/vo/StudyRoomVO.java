package com.spring.manage.vo;

public class StudyRoomVO {
	private int studyroom_num; // 스터디룸 번호
	private int sr_seat_num; // 각 스터디룸 내 좌석 번호
	private char rechargable; // 충전가능여부 (좌석 근처에 콘세트 유무 여부를 Y와 N으로 표시)
	private String seated_status; // 4개의 시간대중 현재 예약된 시간대의 수
	private int room_x; // 스터디룸의 위치 좌표
	private int room_y; // 스터디룸의 위치 좌표
	private int seat_x; // 좌석의 위치 좌표
	private int seat_y; // 좌석의 위치 좌표
	
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

	public int getRoom_x() {
		return room_x;
	}

	public void setRoom_x(int room_x) {
		this.room_x = room_x;
	}

	public int getRoom_y() {
		return room_y;
	}

	public void setRoom_y(int room_y) {
		this.room_y = room_y;
	}

	public int getSeat_x() {
		return seat_x;
	}

	public void setSeat_x(int seat_x) {
		this.seat_x = seat_x;
	}

	public int getSeat_y() {
		return seat_y;
	}

	public void setSeat_y(int seat_y) {
		this.seat_y = seat_y;
	}

	@Override
	public String toString() {
		return "StudyRoomVO [studyroom_num=" + studyroom_num + ", sr_seat_num=" + sr_seat_num + ", rechargable="
				+ rechargable + ", seated_status=" + seated_status + ", room_x=" + room_x + ", room_y=" + room_y
				+ ", seat_x=" + seat_x + ", seat_y=" + seat_y + "]";
	}

}

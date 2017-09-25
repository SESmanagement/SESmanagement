package com.spring.manage.vo;

public class StudyRoomVO { //
	private int studyroom_num; // 스터디룸 번호
	private int sr_seat_num; // 각 스터디룸 내 좌석 번호
	private String seated_status; // 4개의 시간대중 현재 예약된 시간대의 수
	private int room_x; // 스터디룸의 위치 좌표
	private int room_y; // 스터디룸의 위치 좌표
	private int seat_x; // 좌석의 위치 좌표
	private int seat_y; // 좌석의 위치 좌표
	private int activate; // 좌석의 활성화 여부
	private int seven; // 19시 예약여부
	private int eight; // 20시 예약여부
	private int nine; // 21시 예약여부
	private int ten; // 22시 예약여부
	private int count_seat; // 해당 스터디룸의 보유 좌석수
	
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
	
	public int getActivate() {
		return activate;
	}

	public void setActivate(int activate) {
		this.activate = activate;
	}
	
	public int getSeven() {
		return seven;
	}

	public void setSeven(int seven) {
		this.seven = seven;
	}

	public int getEight() {
		return eight;
	}

	public void setEight(int eight) {
		this.eight = eight;
	}

	public int getNine() {
		return nine;
	}

	public void setNine(int nine) {
		this.nine = nine;
	}

	public int getTen() {
		return ten;
	}

	public void setTen(int ten) {
		this.ten = ten;
	}
	
	public int getCount_seat() {
		return count_seat;
	}

	public void setCount_seat(int count_seat) {
		this.count_seat = count_seat;
	}

	@Override
	public String toString() {
		return "StudyRoomVO [studyroom_num=" + studyroom_num + ", sr_seat_num=" + sr_seat_num + ", + ", seated_status=" 
				+ seated_status + ", room_x=" + room_x + ", room_y=" + room_y
				+ ", seat_x=" + seat_x + ", seat_y=" + seat_y + ", activate=" + activate + ", seven=" + seven
				+ ", eight=" + eight + ", nine=" + nine + ", ten=" + ten + ", count_seat=" + count_seat + "]";
	}

}

package com.spring.manage.vo;

public class Room_StatusVO {
	private int classRoom_num;	//강의실 번호
	private int seat;			//좌석 번호
	private int serviceable;	//사용가능 여부

	public Room_StatusVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Room_StatusVO(int classRoom_num, int seat, int serviceable) {
		super();
		this.classRoom_num = classRoom_num;
		this.seat = seat;
		this.serviceable = serviceable;
	}

	public int getClassRoom_num() {
		return classRoom_num;
	}

	public void setClassRoom_num(int classRoom_num) {
		this.classRoom_num = classRoom_num;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public int getServiceable() {
		return serviceable;
	}

	public void setServiceable(int serviceable) {
		this.serviceable = serviceable;
	}

	@Override
	public String toString() {
		return "Room_StatusVO [classRoom_num=" + classRoom_num + ", seat=" + seat + ", serviceable=" + serviceable
				+ "]";
	}
	
	
	
}

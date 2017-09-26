package com.spring.manage.vo;

public class SR_FacilityVO { //
	private int studyroom_num; // 스터디룸 번호
	private int facility_num; // 부대시설 번호 (0)
	private String facility_name; // 부대시설 이름
	private int seat_x; // 좌석의 위치 좌표
	private int seat_y; // 좌석의 위치 좌표
	private int activate; // 좌석의 활성화 여부
	
	public SR_FacilityVO() {}

	public int getStudyroom_num() {
		return studyroom_num;
	}

	public void setStudyroom_num(int studyroom_num) {
		this.studyroom_num = studyroom_num;
	}

	public int getFacility_num() {
		return facility_num;
	}

	public void setFacility_num(int facility_num) {
		this.facility_num = facility_num;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
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

	@Override
	public String toString() {
		return "SR_facilityVO [studyroom_num=" + studyroom_num + ", facility_num=" + facility_num + ", facility_name="
				+ facility_name + ", seat_x=" + seat_x + ", seat_y=" + seat_y + ", activate=" + activate + "]";
	}

}

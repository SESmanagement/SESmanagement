package com.spring.manage.vo;

public class StudyRoomVO {
	private int studyroom_num; // ���͵�� ��ȣ
	private int sr_seat_num; // �� ���͵�� �� �¼� ��ȣ
	private char rechargable; // �������ɿ��� (�¼� ��ó�� �ܼ�Ʈ ���� ���θ� Y�� N���� ǥ��)
	private String seated_status; // ���� �¼� ��ġ ��Ȳ (������ / ���డ�� / ����Ұ�-������ ó��)
	
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

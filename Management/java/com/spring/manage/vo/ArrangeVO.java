	package com.spring.manage.vo;

public class ArrangeVO {
	
	private int party_num;
	private int student_num;
	private String name;
	private int it_1;
	private int it_2;
	private int it_3;
	private int jap_1;
	private int jap_2;
	private int jap_3;
	private int live_score;
	private int classroom_num;
	private int status_room_seat;
	private double totalIJ1;
	private double totalIJ2;
	private double totalIJ3;

	public ArrangeVO() {}

	public ArrangeVO(int party_num, int student_num, String name, int it_1, int it_2, int it_3, int jap_1, int jap_2,
			int jap_3, int live_score, int classroom_num, int status_room_seat, double totalIJ1, double totalIJ2,
			double totalIJ3) {
		super();
		this.party_num = party_num;
		this.student_num = student_num;
		this.name = name;
		this.it_1 = it_1;
		this.it_2 = it_2;
		this.it_3 = it_3;
		this.jap_1 = jap_1;
		this.jap_2 = jap_2;
		this.jap_3 = jap_3;
		this.live_score = live_score;
		this.classroom_num = classroom_num;
		this.status_room_seat = status_room_seat;
		this.totalIJ1 = totalIJ1;
		this.totalIJ2 = totalIJ2;
		this.totalIJ3 = totalIJ3;
	}

	public int getParty_num() {
		return party_num;
	}

	public void setParty_num(int party_num) {
		this.party_num = party_num;
	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getClassroom_num() {
		return classroom_num;
	}

	public void setClassroom_num(int classroom_num) {
		this.classroom_num = classroom_num;
	}

	public int getStatus_room_seat() {
		return status_room_seat;
	}

	public void setStatus_room_seat(int status_room_seat) {
		this.status_room_seat = status_room_seat;
	}

	public double getTotalIJ1() {
		return totalIJ1;
	}

	public void setTotalIJ1(double totalIJ1) {
		this.totalIJ1 = totalIJ1;
	}

	public double getTotalIJ2() {
		return totalIJ2;
	}

	public void setTotalIJ2(double totalIJ2) {
		this.totalIJ2 = totalIJ2;
	}

	public double getTotalIJ3() {
		return totalIJ3;
	}

	public void setTotalIJ3(double totalIJ3) {
		this.totalIJ3 = totalIJ3;
	}

	@Override
	public String toString() {
		return "ArrangeVO [party_num=" + party_num + ", student_num=" + student_num + ", name=" + name + ", it_1="
				+ it_1 + ", it_2=" + it_2 + ", it_3=" + it_3 + ", jap_1=" + jap_1 + ", jap_2=" + jap_2 + ", jap_3="
				+ jap_3 + ", live_score=" + live_score + ", classroom_num=" + classroom_num + ", status_room_seat="
				+ status_room_seat + ", totalIJ1=" + totalIJ1 + ", totalIJ2=" + totalIJ2 + ", totalIJ3=" + totalIJ3
				+ "]\n";
	}

	
	
}
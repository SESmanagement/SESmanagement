package com.spring.manage.vo;

public class PartyVO {
//	PARTY_NUM
//	TOTAL_MEMBER
//	START_DATE
//	END_DATE
	
	private int party_num;
	private int total_member;
	private String start_date;
	private String end_date;
	
	public PartyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PartyVO(int party_num, int total_member, String start_date, String end_date) {
		super();
		this.party_num = party_num;
		this.total_member = total_member;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public int getParty_num() {
		return party_num;
	}

	public void setParty_num(int party_num) {
		this.party_num = party_num;
	}

	public int getTotal_member() {
		return total_member;
	}

	public void setTotal_member(int total_member) {
		this.total_member = total_member;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {	
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "PartyVO [party_num=" + party_num + ", total_member=" + total_member + ", start_date=" + start_date
				+ ", end_date=" + end_date + "]";
	}
	
	
	
}

package com.spring.manage.vo;

public class GroupVO {
	
	private int group_num;		//소모임번호
	private String group_title;	//소모임제목
	private int headcount;		//인원수
	private String start_date;	//시작일자
	private String end_date;	//끝일자
	private String content;		//내용
	private int penalty;		//벌금
	private int owner; // 소모임장, Member테이블의 student_num을 참조
	private String owner_name;
	
	public GroupVO() { }
	
	public GroupVO(int group_num, String group_title, int headcount, String start_date, String end_date, String content,
			int penalty, int owner, String owner_name) {
		this.group_num = group_num;
		this.group_title = group_title;
		this.headcount = headcount;
		this.start_date = start_date;
		this.end_date = end_date;
		this.content = content;
		this.penalty = penalty;
		this.owner = owner;
		this.owner_name = owner_name;
	}

	
	
	
	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public String getGroup_title() {
		return group_title;
	}
	public void setGroup_title(String group_title) {
		this.group_title = group_title;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPenalty() {
		return penalty;
	}
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}

}

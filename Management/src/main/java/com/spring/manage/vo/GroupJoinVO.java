package com.spring.manage.vo;

public class GroupJoinVO {

	private int group_num;
	private int student_num;
	private int penalty_per;
	private String penalty_date;
	private String name;
	
	public GroupJoinVO() {	}
	
	




	@Override
	public String toString() {
		return "GroupJoinVO [group_num=" + group_num + ", student_num=" + student_num + ", penalty_per=" + penalty_per
				+ ", penalty_date=" + penalty_date + ", name=" + name + "]";
	}






	public GroupJoinVO(int group_num, int student_num, int penalty_per, String penalty_date, String name) {
		this.group_num = group_num;
		this.student_num = student_num;
		this.penalty_per = penalty_per;
		this.penalty_date = penalty_date;
		this.name = name;
	}






	public String getPenalty_date() {
		return penalty_date;
	}






	public void setPenalty_date(String penalty_date) {
		this.penalty_date = penalty_date;
	}






	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public int getPenalty_per() {
		return penalty_per;
	}

	public void setPenalty_per(int penalty_per) {
		this.penalty_per = penalty_per;
	}

	
	
	
	
}

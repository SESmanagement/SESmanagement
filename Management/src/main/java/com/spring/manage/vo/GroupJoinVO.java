package com.spring.manage.vo;

public class GroupJoinVO {

	private int group_num;
	private int student_num;
	private int penalty_per;
	
	public GroupJoinVO() {	}
	

	public GroupJoinVO(int group_num, int student_num, int penalty_per) {
		this.group_num = group_num;
		this.student_num = student_num;
		this.penalty_per = penalty_per;
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

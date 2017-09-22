package com.spring.manage.vo;

public class MyGroupVO {

	int group_num;	//그룹번호
	int dday; //시작한날로부터 며칠 지남
	int end;  //끝나는날까지 며칠 남음
	int percent;	//퍼센트진행율
	
	
	public MyGroupVO(int group_num, int dday, int end, int percent) {
		this.group_num = group_num;
		this.dday = dday;
		this.end = end;
		this.percent = percent;
	}

	public MyGroupVO() { }

	
	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	


	
	
	
	
	
}

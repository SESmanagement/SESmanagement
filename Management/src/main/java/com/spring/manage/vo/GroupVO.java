package com.spring.manage.vo;

public class GroupVO {
	
	
	//^^;;;왜 이렇게 많아진거지...
	
	
	private int r_num;			//글 순서대로 가져오기 위한 row_number
	private int group_num;		//소모임번호
	private String group_title;	//소모임제목
	private String seek_start_date;	//모집시작일자
	private String seek_end_date;	//모집끝일자
	private String start_date;	//시작일자
	private String end_date;	//끝일자
	private int penalty;		//벌금
	private String content;		//내용
	private int headcount;		//인원수
	private String content_detail; 	//해쉬태그
	private int student_num; // 소모임장, Member테이블의 student_num을 참조
	private String owner_name;	//소모임장 이름
	private int dday;			//시작일로부터 지난 시간
	private int end;			//시작일까지 남은 시간
	private int percent;		//진행퍼센테이지
	
	
	
	public GroupVO() { }



	@Override
	public String toString() {
		return "GroupVO [r_num=" + r_num + ", group_num=" + group_num + ", group_title=" + group_title
				+ ", seek_start_date=" + seek_start_date + ", seek_end_date=" + seek_end_date + ", start_date="
				+ start_date + ", end_date=" + end_date + ", penalty=" + penalty + ", content=" + content
				+ ", headcount=" + headcount + ", content_detail=" + content_detail + ", student_num=" + student_num + ", owner_name="
				+ owner_name + ", dday=" + dday + ", end=" + end + ", percent=" + percent + "]";
	}



	public GroupVO(int r_num, int group_num, String group_title, String seek_start_date, String seek_end_date,
			String start_date, String end_date, int penalty, String content, int headcount, String content_detail,
			int student_num, String owner_name, int dday, int end, int percent) {
		this.r_num = r_num;
		this.group_num = group_num;
		this.group_title = group_title;
		this.seek_start_date = seek_start_date;
		this.seek_end_date = seek_end_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.penalty = penalty;
		this.content = content;
		this.headcount = headcount;
		this.content_detail = content_detail;
		this.student_num = student_num;
		this.owner_name = owner_name;
		this.dday = dday;
		this.end = end;
		this.percent = percent;
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



	public String getSeek_start_date() {
		return seek_start_date;
	}




	public void setSeek_start_date(String seek_start_date) {
		this.seek_start_date = seek_start_date;
	}




	public String getSeek_end_date() {
		return seek_end_date;
	}




	public void setSeek_end_date(String seek_end_date) {
		this.seek_end_date = seek_end_date;
	}




	public String getContent_detail() {
		return content_detail;
	}




	public void setContent_detail(String content_detail) {
		this.content_detail = content_detail;
	}




	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
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

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	
	
	
	
	
}
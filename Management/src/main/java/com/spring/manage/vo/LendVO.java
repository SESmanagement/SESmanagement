package com.spring.manage.vo;

public class LendVO {
	
	private int num;
	private int student_num;
	private int book_num;
	private String startdate;
	private String enddate;
	private String returndate;
	private String title;
	private String username;
	private String status;
	
	public LendVO() {
		super();
	}
	
	public LendVO(int num, int student_num, int book_num, String startdate, String enddate, String returndate,
			String title, String username, String status) {
		super();
		this.num = num;
		this.student_num = student_num;
		this.book_num = book_num;
		this.startdate = startdate;
		this.enddate = enddate;
		this.returndate = returndate;
		this.title = title;
		this.username = username;
		this.status = status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStudent_num() {
		return student_num;
	}
	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getReturndate() {
		return returndate;
	}
	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "LendVO [num=" + num + ", student_num=" + student_num + ", book_num=" + book_num + ", startdate="
				+ startdate + ", enddate=" + enddate + ", returndate=" + returndate + ", title=" + title + ", username="
				+ username + ", status=" + status + "]";
	}	
}
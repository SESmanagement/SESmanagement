package com.spring.manage.vo;

public class LendVO {
	
	private int num;
	private String mem_num;
	private String booknum;
	private String startdate;
	private String enddate;
	private String returndate;
	private String title;
	private String name;
	private String status;
	public LendVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LendVO(int num, String mem_num, String booknum, String startdate, String enddate, String returndate,
			String title, String name, String status) {
		super();
		this.num = num;
		this.mem_num = mem_num;
		this.booknum = booknum;
		this.startdate = startdate;
		this.enddate = enddate;
		this.returndate = returndate;
		this.title = title;
		this.name = name;
		this.status = status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}
	public String getBooknum() {
		return booknum;
	}
	public void setBooknum(String booknum) {
		this.booknum = booknum;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "LendVO [num=" + num + ", mem_num=" + mem_num + ", booknum=" + booknum + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", returndate=" + returndate + ", title=" + title + ", name=" + name
				+ ", status=" + status + "]";
	}
	
	
}
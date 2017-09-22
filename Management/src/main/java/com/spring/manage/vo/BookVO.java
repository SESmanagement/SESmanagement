	package com.spring.manage.vo;

public class BookVO {
	
	private int num;
	private String title;
	private String publisher;
	private String author;
	private String content;
	private String status;
	private String imageurl;
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookVO(int num, String title, String publisher, String author, String content, String status,
			String imageurl) {
		super();
		this.num = num;
		this.title = title;
		this.publisher = publisher;
		this.author = author;
		this.content = content;
		this.status = status;
		this.imageurl = imageurl;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "BookVO [num=" + num + ", title=" + title + ", publisher=" + publisher + ", author=" + author
				+ ", content=" + content + ", status=" + status + ", imageurl=" + imageurl + "]";
	}
	
	
}
	package com.spring.manage.vo;

public class BookVO {
	
	private int book_num;
	private String name;
	private String title;
	private String content;
	
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public BookVO(int book_num, String name, String title, String content) {
		super();
		this.book_num = book_num;
		this.name = name;
		this.title = title;
		this.content = content;
	}
	public BookVO() {
	}
}
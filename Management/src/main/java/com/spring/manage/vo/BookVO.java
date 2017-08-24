	package com.spring.manage.vo;

public class BookVO {
	
	private int book_num;
	private int isbn_num;
	private String title;
	private String publisher;
	private String author;
	private String content;
	private String img_src;
	private String status;
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookVO(int book_num, int isbn_num, String title, String publisher, String author, String content,
			String img_src, String status) {
		super();
		this.book_num = book_num;
		this.isbn_num = isbn_num;
		this.title = title;
		this.publisher = publisher;
		this.author = author;
		this.content = content;
		this.img_src = img_src;
		this.status = status;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public int getIsbn_num() {
		return isbn_num;
	}
	public void setIsbn_num(int isbn_num) {
		this.isbn_num = isbn_num;
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
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BookVO [book_num=" + book_num + ", isbn_num=" + isbn_num + ", title=" + title + ", publisher="
				+ publisher + ", author=" + author + ", content=" + content + ", img_src=" + img_src + ", status="
				+ status + "]";
	}
	

	}

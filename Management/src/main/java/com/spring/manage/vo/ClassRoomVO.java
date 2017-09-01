package com.spring.manage.vo;

public class ClassRoomVO {
/*	num number primary key,
	name varchar2(40) not null,
	width number default 0,
	height number default 0
*/
	private int num;
	private String name;
	private int width;
	private int height;
	private int party_num;

	public ClassRoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClassRoomVO(int num, String name, int width, int height, int party_num) {
		super();
		this.num = num;
		this.name = name;
		this.width = width;
		this.height = height;
		this.party_num = party_num;
	}

	public int getParty_num() {
		return party_num;
	}

	public void setParty_num(int party_num) {
		this.party_num = party_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	@Override
	public String toString() {
		return "classRoomVO [num=" + num + ", name=" + name + ", width=" + width + ", height=" + height + ", party_num="
				+ party_num + "]";
	}

	
	
	
	
	
}

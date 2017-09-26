package com.spring.manage.vo;

import java.util.Date;

public class MemberVO {

	private String num;			// 
	private int student_num;		//학번
	private String pwd;				//비밀번호
	private int party_num;			//기수번호
	private String name;			//성별
	private String sex;				//성별 : M, W
	private String call;			//전화 번호
	private String phone;			//핸드폰 번호
	private String zip;				//우편번호
	private String address1;		//주소1
	private String address2;		//주소2
	private String email;			//이메일
	private String photo;			//포토
	private Date birthdate;			//생일
	private int status_room_seat;	//이 사람의 좌석번호
	private int classroom_num;
	
	//기본생성자
	public MemberVO() {}

	public MemberVO(int student_num, String pwd, int party_num, String name, String sex, String call, String phone,
			String zip, String address1, String address2, String email, String photo, Date birthdate,
			int status_room_seat, int classroom_num) {
		super();
		this.student_num = student_num;
		this.pwd = pwd;
		this.party_num = party_num;
		this.name = name;
		this.sex = sex;
		this.call = call;
		this.phone = phone;
		this.zip = zip;
		this.address1 = address1;
		this.address2 = address2;
		this.email = email;
		this.photo = photo;
		this.birthdate = birthdate;
		this.status_room_seat = status_room_seat;
		this.classroom_num = classroom_num;
	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getParty_num() {
		return party_num;
	}

	public void setParty_num(int party_num) {
		this.party_num = party_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public int getStatus_room_seat() {
		return status_room_seat;
	}

	public void setStatus_room_seat(int status_room_seat) {
		this.status_room_seat = status_room_seat;
	}

	public int getClassroom_num() {
		return classroom_num;
	}

	public void setClassroom_num(int classroom_num) {
		this.classroom_num = classroom_num;
	}

	@Override
	public String toString() {
		return "MemberVO [student_num=" + student_num + ", pwd=" + pwd + ", party_num=" + party_num + ", name=" + name
				+ ", sex=" + sex + ", call=" + call + ", phone=" + phone + ", zip=" + zip + ", address1=" + address1
				+ ", address2=" + address2 + ", email=" + email + ", photo=" + photo + ", birthdate=" + birthdate
				+ ", status_room_seat=" + status_room_seat + ", classroom_num=" + classroom_num + "]";
	}


	
}


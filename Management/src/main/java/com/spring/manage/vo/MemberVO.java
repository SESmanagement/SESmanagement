package com.spring.manage.vo;

import java.util.Date;

public class MemberVO {
	
	private int student_num;	//학번
	private String pwd;			//비밀번호
	private int member_num;		//기수번호
	private String name;		//이름
	private String sex;			//성별
	private String zip;			//우편번호
	private String address;		//주소
	private String email;		//메일
	private String photo;		//사진
	private Date birthdate;		//생일
	private Date start_date;	//기수시작일
	private Date end_date;		//기수종료일
	
	
	
	//toString 오버라이딩
	@Override
	public String toString() {
		return "MemberVO [student_num=" + student_num + ", pwd=" + pwd + ", member_num=" + member_num + ", name=" + name
				+ ", sex=" + sex + ", zip=" + zip + ", address=" + address + ", email=" + email + ", photo=" + photo
				+ ", birthdate=" + birthdate + ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}


	//기본생성자
	public MemberVO() {}
	

	//명시적생성자
	public MemberVO(int student_num, String pwd, int member_num, String name, String sex, String zip, String address,
			String email, String photo, Date birthdate, Date start_date, Date end_date) {
		this.student_num = student_num;
		this.pwd = pwd;
		this.member_num = member_num;
		this.name = name;
		this.sex = sex;
		this.zip = zip;
		this.address = address;
		this.email = email;
		this.photo = photo;
		this.birthdate = birthdate;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	
	
	//getter, setter
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


	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
	
	

}

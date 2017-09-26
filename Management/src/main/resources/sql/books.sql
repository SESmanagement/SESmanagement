-- books 시퀀스 생성
CREATE SEQUENCE BOOK_SEQ;	

--lend 시퀀스
CREATE sequence lend_seq
start with 1
increment by 1;


----book table
CREATE TABLE books
(
	num number PRIMARY KEY,
	title varchar2(100) not null,
	publisher varchar2(100) not null,
	author varchar2(100) not null,
	content varchar2(100) not null,
	imageurl varchar2(100) not null
);		

---- lend table
CREATE TABLE lend
(
	num number PRIMARY KEY,
	mem_num number references member(student_num),
	booknum number references books(num),
	startdate date not null,
	enddate date,
	returndate date,
	status varchar2(30) not null
);

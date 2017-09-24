-- boos 시퀀스 생성
CREATE SEQUENCE BOOK_SEQ;

-- boos table 생성

CREATE TABLE books
(
	num number PRIMARY KEY,
	title varchar2(100) not ull,
	publisher varchar2(100) not null,
	author varchar2(100) not null,
	content varchar2(100) not null,
	imageurl varchar2(100) not null
);		

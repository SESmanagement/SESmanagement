<<<<<<< HEAD
﻿**MEMBER 테이블 생성
STUDENT_NUM NUMBER PRIMARY KEY,
PWD VARCHAR(20) NOT NULL,
MEMBER_NUM NUMBER NOT NULL,
NAME VARCHAR2(20) NOT NULL,
SEX VARCHAR2(5) NOT NULL,
ZIP VARCHAR2(100),
ADDRESS VARCHAR2(200),
EMAIL VARCHAR2(100),
PHOTO VARCHAR2(200) NOT NULL,
BIRTHDATE TIMESTAMP NOT NULL,
START_DATE TIMESTAMP,
END_DATE TIMESTAMP
=======
<<<<<<< HEAD
CREATE TABLE SUGGESTION					
(					
	BOOK_NUM NUMBER PRIMARY KEY,				
	ISBN_NUM VARCHAR2(13) UNIQUE NOT NULL,				
	TITLE VARCHAR2(50) NOT NULL,				
	PUBLISHER VARCHAR2(20) NOT NULL,				
	AUTHOR VARCHAR2(20) NOT NULL,				
	CONTENT VARCHAR2(2000) NOT NULL,				
	IMG_SRC VARCHAR2(100) NOT NULL				
);					
					
CREATE SEQUENCE BOOK_SEQ;					
=======
-- MEMBER 테이블 생성
CREATE TABLE MEMBER	
(	
	STUDENT_NUM NUMBER PRIMARY KEY,
	PWD VARCHAR(20) NOT NULL,
	MEMBER_NUM NUMBER NOT NULL,
	NAME VARCHAR2(20) NOT NULL,
	SEX VARCHAR2(5) NOT NULL,
	ZIP VARCHAR2(100),
	ADDRESS VARCHAR2(200),
	EMAIL VARCHAR2(100),
	PHOTO VARCHAR2(200) NOT NULL,
	BIRTHDATE TIMESTAMP NOT NULL,
	START_DATE TIMESTAMP,
	END_DATE TIMESTAMP
);	

-- member더미데이터
//2017-08-22 김정헌
insert into member values(00001, 111111, 33, '관리자', 'm', '134-012', '코엑스', 'february369@gmail.com', 'photo', 11-11-11, '2000-01-01', '2099-12-1'); 
insert into member values(33001, 910110, 33, '백록담', 'f', null, null, null, 'photo', '91-01-10', null, null);
insert into member values(33002, 880222, 33, '김정헌', 'm', null, null, null, 'photo', '88-02-22', null, null);
insert into member values(33003, 900321, 33, '윤성현', 'm', null, null, null, 'photo', '90-03-21', null, null);
insert into member values(33004, 870205, 33, '김선혜', 'f', null, null, null, 'photo', '87-02-05', null, null);
insert into member values(33005, 901124, 33, '강주영', 'm', null, null, null, 'photo', '90-11-24', null, null);
insert into member values(33006, 900312, 33, '송재영', 'm'. null, null, null, 'photo', '90-03-12', null, null);
>>>>>>> branch 'master' of https://github.com/SESmanagement/SESmanagement.git

-- member더미데이터

<<<<<<< HEAD
//member더미데이터
insert into member values(33001, 910110, 33, '록담', 'f', null, null, null, 'photo', '91-01-10', null, null);
//관리자 아이디
insert into member values(00001, 111111, 33, '관리자', 'm', '134-012', '코엑스', 'february369@gmail.com', 'photo', '11-11-11', '00-01-01', '99-12-01');
//2017-08-22 김정헌 
insert into member values(33001, 910110, 33, '백록담', 'f', null, null, null, 'photo', '91-01-10', null, null);
insert into member values(33002, 880222, 33, '김정헌', 'm', null, null, null, 'photo', '88-02-22', null, null);
insert into member values(33003, 900321, 33, '윤성현', 'm', null, null, null, 'photo', '90-03-21', null, null);
insert into member values(33004, 870205, 33, '김선혜', 'f', null, null, null, 'photo', '87-02-05', null, null);
insert into member values(33005, 901124, 33, '강주영', 'm', null, null, null, 'photo', '90-11-24', null, null);
insert into member values(33006, 900312, 33, '송재영', 'm', null, null, null, 'photo', '90-03-12', null, null);










**StudyRoom DB관련
// 20170821 TEST용 테이블 임시 생성
=======
-- StudyRoom DB관련
-- 20170821 TEST용 테이블 임시 생성
>>>>>>> branch 'master' of https://github.com/SESmanagement/SESmanagement.git
CREATE TABLE STUDYROOM
(
	STUDYROOM_NUM NUMBER NOT NULL,
	SR_SEAT_NUM NUMBER NOT NULL,
	RECHARGABLE VARCHAR2(5) DEFAULT 'N' NOT NULL,
	CONSTRAINT STUDYROOM_PK PRIMARY KEY(STUDYROOM_NUM, SR_SEAT_NUM),
	SEATED_STATUS VARCHAR2(10) DEFAULT 'VACANCY' NOT NULL
);

//StyduRoom 더미데이터
INSERT INTO STUDYROOM VALUES(1, 1, 'N', VACANCY);
INSERT INTO STUDYROOM VALUES(1, 2, 'N', VACANCY);
INSERT INTO STUDYROOM VALUES(1, 3, 'Y', VACANCY);
INSERT INTO STUDYROOM VALUES(1, 4, 'Y', VACANCY);
INSERT INTO STUDYROOM VALUES(2, 1, 'Y', VACANCY);
INSERT INTO STUDYROOM VALUES(2, 2, 'Y', VACANCY);
INSERT INTO STUDYROOM VALUES(2, 3, 'Y', VACANCY);
INSERT INTO STUDYROOM VALUES(2, 4, 'Y', VACANCY);
>>>>>>> branch 'master' of https://github.com/SESmanagement/SESmanagement.git

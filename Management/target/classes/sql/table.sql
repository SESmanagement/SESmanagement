<<<<<<< HEAD
﻿﻿**MEMBER 테이블 생성
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

**건의사항 테이블 생성
=======
>>>>>>> branch 'master' of https://github.com/SESmanagement/SESmanagement.git
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
-- 2017-08-22 김정헌 <33기 멤버들>
insert into member values(00001, 111111, 33, '관리자', 'm', '134-012', '코엑스', 'february369@gmail.com', 'photo', '11-11-11', '00-01-01', '99-12-01');
insert into member values(33001, 910110, 33, '백록담', 'f', null, null, null, 'photo', '91-01-10', null, null);
insert into member values(33002, 880222, 33, '김정헌', 'm', null, null, null, 'photo', '88-02-22', null, null);
insert into member values(33003, 900321, 33, '윤성현', 'm', null, null, null, 'photo', '90-03-21', null, null);
insert into member values(33004, 870205, 33, '김선혜', 'f', null, null, null, 'photo', '87-02-05', null, null);
insert into member values(33005, 901124, 33, '강주영', 'm', null, null, null, 'photo', '90-11-24', null, null);
insert into member values(33006, 900312, 33, '송재영', 'm', null, null, null, 'photo', '90-03-12', null, null);
insert into member values(33007, 900101, 33, '이웅희', 'm', null, null, null, 'photo', '90-01-01', null, null);
insert into member values(33008, 900102, 33, '윤선영', 'f', null, null, null, 'photo','90-01-02', null, null);
insert into member values(33009, 900103, 33, '이유정', 'm', null, null, null, 'photo','90-01-03', null, null);
insert into member values(33010, 900104, 33, '신웅수', 'm', null, null, null, 'photo','90-01-04', null, null);
insert into member values(33011, 900105, 33, '정재훈', 'm', null, null, null, 'photo','90-01-05', null, null);
insert into member values(33012, 900106, 33, '홍규희', 'f', null, null, null, 'photo','90-01-06', null, null);
insert into member values(33013, 900107, 33, '박가람', 'f', null, null, null, 'photo','90-01-07', null, null);
insert into member values(33014, 900108, 33, '정성찬', 'm', null, null, null, 'photo','90-01-08', null, null);
insert into member values(33015, 900109, 33, '김미현', 'f', null, null, null, 'photo','90-01-09', null, null);
insert into member values(33016, 900110, 33, '이지윤', 'm', null, null, null, 'photo','90-01-10', null, null);
insert into member values(33017, 900111, 33, '김형주', 'm', null, null, null, 'photo','90-01-11', null, null);
insert into member values(33018, 900112, 33, '안형태', 'm', null, null, null, 'photo','90-01-12', null, null);
insert into member values(33019, 900113, 33, '김하영', 'f', null, null, null, 'photo','90-01-13', null, null);
insert into member values(33020, 900114, 33, '박소연', 'f', null, null, null, 'photo','90-01-14', null, null);
insert into member values(33021, 900115, 33, '김현민', 'm', null, null, null, 'photo','90-01-15', null, null);
insert into member values(33022, 900116, 33, '김진표', 'm', null, null, null, 'photo','90-01-16', null, null);
insert into member values(33023, 900117, 33, '김동근', 'm', null, null, null, 'photo','90-01-17', null, null);
insert into member values(33024, 900118, 33, '이민후', 'm', null, null, null, 'photo','90-01-18', null, null);
insert into member values(33025, 900119, 33, '박석환', 'm', null, null, null, 'photo','90-01-19', null, null);
insert into member values(33026, 900120, 33, '김도훈', 'm', null, null, null, 'photo','90-01-20', null, null);
insert into member values(33027, 900121, 33, '허정은', 'f', null, null, null, 'photo','90-01-21', null, null);
insert into member values(33028, 900122, 33, '정진석', 'm', null, null, null, 'photo','90-01-22', null, null);
insert into member values(33029, 900123, 33, '한희진', 'm', null, null, null, 'photo','90-01-23', null, null);
insert into member values(33030, 900124, 33, '김상인', 'm', null, null, null, 'photo','90-01-24', null, null);
insert into member values(33031, 900125, 33, '박주현', 'f', null, null, null, 'photo','90-01-25', null, null);
insert into member values(33032, 900126, 33, '정우석', 'm', null, null, null, 'photo','90-01-26', null, null);
insert into member values(33033, 900127, 33, '김동식', 'm', null, null, null, 'photo','90-01-27', null, null);
insert into member values(33034, 900128, 33, '김호인', 'm', null, null, null, 'photo','90-01-28', null, null);
insert into member values(33035, 900201, 33, '신준용', 'm', null, null, null, 'photo','90-02-01', null, null);
insert into member values(33036, 900202, 33, '김재나', 'f', null, null, null, 'photo','90-02-02', null, null);
insert into member values(33037, 900203, 33, '안현태', 'm', null, null, null, 'photo','90-02-03', null, null);
insert into member values(33038, 900204, 33, '이은지', 'f', null, null, null, 'photo','90-02-04', null, null);
insert into member values(33039, 900205, 33, '고지혜', 'f', null, null, null, 'photo','90-02-05', null, null);
insert into member values(33040, 900206, 33, '최경민', 'm', null, null, null, 'photo','90-02-06', null, null);
insert into member values(33041, 900207, 33, '고정욱', 'm', null, null, null, 'photo','90-02-07', null, null);
insert into member values(33042, 900208, 33, '이재준', 'm', null, null, null, 'photo','90-02-08', null, null);
insert into member values(33043, 900209, 33, '조영두', 'm', null, null, null, 'photo','90-02-09', null, null);
insert into member values(33044, 900210, 33, '홍준민', 'm', null, null, null, 'photo','90-02-10', null, null);
insert into member values(33045, 900211, 33, '우종완', 'm', null, null, null, 'photo','90-02-11', null, null);
insert into member values(33046, 900212, 33, '우성민', 'f', null, null, null, 'photo','90-02-12', null, null);
insert into member values(33047, 900213, 33, '박준환', 'm', null, null, null, 'photo','90-02-13', null, null);
insert into member values(33048, 900214, 33, '김승한', 'm', null, null, null, 'photo','90-02-14', null, null);
insert into member values(33049, 900215, 33, '정동운', 'm', null, null, null, 'photo','90-02-15', null, null);
insert into member values(33050, 900216, 33, '권근택', 'f', null, null, null, 'photo','90-02-16', null, null);
insert into member values(33051, 900217, 33, '조준석', 'm', null, null, null, 'photo','90-02-17', null, null);
insert into member values(33052, 900218, 33, '송은지', 'f', null, null, null, 'photo','90-02-18', null, null);
insert into member values(33053, 900219, 33, '권보경', 'f', null, null, null, 'photo','90-02-19', null, null);
insert into member values(33054, 900220, 33, '봉미희', 'f', null, null, null, 'photo','90-02-20', null, null);
insert into member values(33055, 900221, 33, '홍길동', 'm', null, null, null, 'photo','90-02-21', null, null);
insert into member values(33056, 900222, 33, '이길영', 'm', null, null, null, 'photo','90-02-22', null, null);
insert into member values(33057, 900223, 33, '이길수', 'm', null, null, null, 'photo','90-02-23', null, null);
insert into member values(33058, 900224, 33, '이민자', 'm', null, null, null, 'photo','90-02-24', null, null);
insert into member values(33059, 900225, 33, '이사람', 'm', null, null, null, 'photo','90-02-25', null, null);
insert into member values(33060, 900226, 33, '저사람', 'm', null, null, null, 'photo','90-02-26', null, null);
insert into member values(33061, 900227, 33, '여기다', 'm', null, null, null, 'photo','90-02-27', null, null);
insert into member values(33062, 900301, 33, '김가가', 'm', null, null, null, 'photo','90-03-01', null, null);
insert into member values(33063, 900302, 33, '이나나', 'f', null, null, null, 'photo','90-03-02', null, null);
insert into member values(33064, 900303, 33, '박다다', 'm', null, null, null, 'photo','90-03-03', null, null);
insert into member values(33065, 900304, 33, '박종호', 'm', null, null, null, 'photo','90-03-04', null, null);
insert into member values(33066, 900305, 33, '박길호', 'm', null, null, null, 'photo','90-03-05', null, null);
insert into member values(33067, 900306, 33, '박상호', 'm', null, null, null, 'photo','90-03-06', null, null);
insert into member values(33068, 900307, 33, '홍민호', 'm', null, null, null, 'photo','90-03-07', null, null);
insert into member values(33069, 900308, 33, '홍준표', 'm', null, null, null, 'photo','90-03-08', null, null);
insert into member values(33070, 900309, 33, '문재인', 'm', null, null, null, 'photo','90-03-09', null, null);
insert into member values(33071, 900310, 33, '나경원', 'f', null, null, null, 'photo','90-03-10', null, null);
insert into member values(33072, 900311, 33, '김대중', 'm', null, null, null, 'photo','90-03-11', null, null);
insert into member values(33073, 900312, 33, '김민주', 'f', null, null, null, 'photo','90-03-12', null, null);
insert into member values(33074, 900313, 33, '채연', 'f', null, null, null, 'photo','90-03-13', null, null);
insert into member values(33075, 900314, 33, '윤아', 'f', null, null, null, 'photo','90-03-14', null, null);
insert into member values(33076, 900315, 33, '쯔위', 'f', null, null, null, 'photo','90-03-15', null, null);
insert into member values(33077, 900316, 33, '휘성', 'm', null, null, null, 'photo','90-03-16', null, null);
insert into member values(33078, 900317, 33, '아이유', 'f', null, null, null, 'photo','90-03-17', null, null);
insert into member values(33079, 900318, 33, '배수지', 'f', null, null, null, 'photo','90-03-18', null, null);
insert into member values(33080, 900319, 33, '정우성', 'm', null, null, null, 'photo','90-03-19', null, null);
insert into member values(33081, 900320, 33, '이재용', 'm', null, null, null, 'photo','90-03-20', null, null);
insert into member values(33082, 900321, 33, '이건희', 'm', null, null, null, 'photo','90-03-21', null, null);
insert into member values(33083, 900322, 33, '권윤정', 'f', null, null, null, 'photo','90-03-22', null, null);
insert into member values(33084, 900323, 33, '권용현', 'm', null, null, null, 'photo','90-03-23', null, null);
insert into member values(33085, 900324, 33, '박기정', 'm', null, null, null, 'photo','90-03-24', null, null);
insert into member values(33086, 900325, 33, '허준영', 'm', null, null, null, 'photo','90-03-25', null, null);
insert into member values(33087, 900326, 33, '김용범', 'm', null, null, null, 'photo','90-03-26', null, null);
insert into member values(33088, 900327, 33, '김용일', 'm', null, null, null, 'photo','90-03-27', null, null);
insert into member values(33089, 900328, 33, '김세영', 'm', null, null, null, 'photo','90-03-28', null, null);
insert into member values(33090, 900329, 33, '김민석', 'm', null, null, null, 'photo','90-03-29', null, null);
insert into member values(33091, 900330, 33, '박기춘', 'm', null, null, null, 'photo','90-03-30', null, null);
insert into member values(33092, 900331, 33, '박래훈', 'm', null, null, null, 'photo','90-03-31', null, null);
insert into member values(33093, 900401, 33, '박보윤', 'f', null, null, null, 'photo','90-04-01', null, null);
insert into member values(33094, 900402, 33, '박의규', 'm', null, null, null, 'photo','90-04-02', null, null);
insert into member values(33095, 900403, 33, '백지은', 'f', null, null, null, 'photo','90-04-03', null, null);
insert into member values(33096, 900404, 33, '진범근', 'm', null, null, null, 'photo','90-04-04', null, null);
insert into member values(33097, 900405, 33, '변진석', 'm', null, null, null, 'photo','90-04-05', null, null);
insert into member values(33098, 900406, 33, '성무진', 'm', null, null, null, 'photo','90-04-06', null, null);
insert into member values(33099, 900407, 33, '성철호', 'm', null, null, null, 'photo','90-04-07', null, null);
insert into member values(33100, 900408, 33, '송우연', 'm', null, null, null, 'photo','90-04-08', null, null);
insert into member values(33101, 900409, 33, '권순민', 'm', null, null, null, 'photo','90-04-09', null, null);
insert into member values(33102, 900410, 33, '심정훈', 'm', null, null, null, 'photo','90-04-10', null, null);
insert into member values(33103, 900411, 33, '이승무', 'f', null, null, null, 'photo','90-04-11', null, null);
insert into member values(33104, 900412, 33, '이길아', 'f', null, null, null, 'photo','90-04-12', null, null);
insert into member values(33105, 900413, 33, '함종수', 'm', null, null, null, 'photo','90-04-13', null, null);
insert into member values(33106, 900414, 33, '지현수', 'm', null, null, null, 'photo','90-04-14', null, null);
insert into member values(33107, 900415, 33, '김태준', 'f', null, null, null, 'photo','90-04-15', null, null);


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



**StudyRoom Reservation DB관련
// 20170823 TEST용 테이블 임시 생성
CREATE TABLE SR_RESERVATION								
(									
	SR_RESV_NUM VARCHAR2(10) PRIMARY KEY,								
	STUDYROOM_NUM NUMBER NOT NULL, 								
	SR_SEAT_NUM NUMBER NOT NULL,																
	START_TIME TIMESTAMP NOT NULL,								
	END_TIME TIMESTAMP NOT NULL,
	FOREIGN KEY (STUDYROOM_NUM, SR_SEAT_NUM) REFERENCES STUDYROOM					
);	
2017년 8월 28일 -- 강의실 테이블
* 차후 멤버테이블 변경해줘야한다.(멤버가 가지고 있는 자리 번호! 꼭 해야합니다~)

-- 테이블 삭제
DROP TABLE ROOM_STATUS;
DROP TABLE CLASSROOM;
DROP TABLE MEMBER;
DROP TABLE PARTY;

-- 1. 기수
create table party(
	party_num number primary key,
	total_member number not null, 
	start_date timestamp,
	end_date timestamp
);

-- 1.1 기수 더미 데이터
insert into party values(0, 1, null, null);
insert into party values(33, 107, '17-03-06', '18-01-24');
insert into party values(34, 174, null, null);

-- 2. 멤버

CREATE TABLE MEMBER(
	STUDENT_NUM NUMBER PRIMARY KEY,
	PWD VARCHAR(20) NOT NULL,
	PARTY_NUM NUMBER NOT NULL REFERENCES PARTY(PARTY_NUM),
	NAME VARCHAR2(20) NOT NULL,
	SEX VARCHAR2(5) NOT NULL,
	ZIP VARCHAR2(100),
	ADDRESS VARCHAR2(200),
	ADDRESS2 VARCHAR2(200),
	EMAIL VARCHAR2(100),
	PHOTO VARCHAR2(200) NOT NULL,
	BIRTHDATE TIMESTAMP NOT NULL,
	REGISTRATION NUMBER DEFAULT 0
);

-- 2.1 멤버 더미데이터
insert into member values(00001, 111111, 0, '관리자', 'm', '134-012', '코엑스','4층', 'february369@gmail.com', 'photo', '99-12-01',0);
insert into member values(33001, 910110, 33, '백록담', 'f', null, null, null, null, null, 'photo', '91-01-10', 0);
insert into member values(33002, 880222, 33, '김정헌', 'm', null, null, null, null, 'photo', '88-02-22', 0);
insert into member values(33003, 900321, 33, '윤성현', 'm', null, null, null, null, 'photo', '90-03-21', 0);
insert into member values(33004, 870205, 33, '김선혜', 'f', null, null, null, null, 'photo', '87-02-05', 0);
insert into member values(33005, 901124, 33, '강주영', 'm', null, null, null, null, 'photo', '90-11-24', 0);
insert into member values(33006, 900312, 33, '송재영', 'm', null, null, null, null, 'photo', '90-03-12', 0);
insert into member values(33007, 900101, 33, '이웅희', 'm', null, null, null, null, 'photo', '90-01-01', 0);
insert into member values(33008, 900102, 33, '윤선영', 'f', null, null, null, null, 'photo','90-01-02', 0);
insert into member values(33009, 900103, 33, '이유정', 'm', null, null, null, null, 'photo','90-01-03', 0);
insert into member values(33010, 900104, 33, '신웅수', 'm', null, null, null, null, 'photo','90-01-04', 0);
insert into member values(33011, 900105, 33, '정재훈', 'm', null, null, null, null, 'photo','90-01-05', 0);
insert into member values(33012, 900106, 33, '홍규희', 'f', null, null, null, null, 'photo','90-01-06', 0);
insert into member values(33013, 900107, 33, '박가람', 'f', null, null, null, null, 'photo','90-01-07', 0);
insert into member values(33014, 900108, 33, '정성찬', 'm', null, null, null, null, 'photo','90-01-08', 0);
insert into member values(33015, 900109, 33, '김미현', 'f', null, null, null, null, 'photo','90-01-09', 0);
insert into member values(33016, 900110, 33, '이지윤', 'm', null, null, null, null, 'photo','90-01-10', 0);
insert into member values(33017, 900111, 33, '김형주', 'm', null, null, null, null, 'photo','90-01-11', 0);
insert into member values(33018, 900112, 33, '안형태', 'm', null, null, null, null, 'photo','90-01-12', 0);
insert into member values(33019, 900113, 33, '김하영', 'f', null, null, null, null, 'photo','90-01-13', 0);
insert into member values(33020, 900114, 33, '박소연', 'f', null, null, null, null, 'photo','90-01-14', 0);
insert into member values(33021, 900115, 33, '김현민', 'm', null, null, null, null, 'photo','90-01-15', 0);
insert into member values(33022, 900116, 33, '김진표', 'm', null, null, null, null, 'photo','90-01-16', 0);
insert into member values(33023, 900117, 33, '김동근', 'm', null, null, null, null, 'photo','90-01-17', 0);
insert into member values(33024, 900118, 33, '이민후', 'm', null, null, null, null, 'photo','90-01-18', 0);
insert into member values(33025, 900119, 33, '박석환', 'm', null, null, null, null, 'photo','90-01-19', 0);
insert into member values(33026, 900120, 33, '김도훈', 'm', null, null, null, null, 'photo','90-01-20', 0);
insert into member values(33027, 900121, 33, '허정은', 'f', null, null, null, null, 'photo','90-01-21', 0);
insert into member values(33028, 900122, 33, '정진석', 'm', null, null, null, null, 'photo','90-01-22', 0);
insert into member values(33029, 900123, 33, '한희진', 'm', null, null, null, null, 'photo','90-01-23', 0);
insert into member values(33030, 900124, 33, '김상인', 'm', null, null, null, null, 'photo','90-01-24', 0);
insert into member values(33031, 900125, 33, '박주현', 'f', null, null, null, null, 'photo','90-01-25', 0);
insert into member values(33032, 900126, 33, '정우석', 'm', null, null, null, null, 'photo','90-01-26', 0);
insert into member values(33033, 900127, 33, '김동식', 'm', null, null, null, null, 'photo','90-01-27', 0);
insert into member values(33034, 900128, 33, '김호인', 'm', null, null, null, null, 'photo','90-01-28', 0);
insert into member values(33035, 900201, 33, '신준용', 'm', null, null, null, null, 'photo','90-02-01', 0);
insert into member values(33036, 900202, 33, '김재나', 'f', null, null, null, null, 'photo','90-02-02', 0);
insert into member values(33037, 900203, 33, '안현태', 'm', null, null, null, null, 'photo','90-02-03', 0);
insert into member values(33038, 900204, 33, '이은지', 'f', null, null, null, null, 'photo','90-02-04', 0);
insert into member values(33039, 900205, 33, '고지혜', 'f', null, null, null, null, 'photo','90-02-05', 0);
insert into member values(33040, 900206, 33, '최경민', 'm', null, null, null, null, 'photo','90-02-06', 0);
insert into member values(33041, 900207, 33, '고정욱', 'm', null, null, null, null, 'photo','90-02-07', 0);
insert into member values(33042, 900208, 33, '이재준', 'm', null, null, null, null, 'photo','90-02-08', 0);
insert into member values(33043, 900209, 33, '조영두', 'm', null, null, null, null, 'photo','90-02-09', 0);
insert into member values(33044, 900210, 33, '홍준민', 'm', null, null, null, null, 'photo','90-02-10', 0);
insert into member values(33045, 900211, 33, '우종완', 'm', null, null, null, null, 'photo','90-02-11', 0);
insert into member values(33046, 900212, 33, '우성민', 'f', null, null, null, null, 'photo','90-02-12', 0);
insert into member values(33047, 900213, 33, '박준환', 'm', null, null, null, null, 'photo','90-02-13', 0);
insert into member values(33048, 900214, 33, '김승한', 'm', null, null, null, null, 'photo','90-02-14', 0);
insert into member values(33049, 900215, 33, '정동운', 'm', null, null, null, null, 'photo','90-02-15', 0);
insert into member values(33050, 900216, 33, '권근택', 'f', null, null, null, null, 'photo','90-02-16', 0);
insert into member values(33051, 900217, 33, '조준석', 'm', null, null, null, null, 'photo','90-02-17', 0);
insert into member values(33052, 900218, 33, '송은지', 'f', null, null, null, null, 'photo','90-02-18', 0);
insert into member values(33053, 900219, 33, '권보경', 'f', null, null, null, null, 'photo','90-02-19', 0);
insert into member values(33054, 900220, 33, '봉미희', 'f', null, null, null, null, 'photo','90-02-20', 0);
insert into member values(33055, 900221, 33, '홍길동', 'm', null, null, null, null, 'photo','90-02-21', 0);
insert into member values(33056, 900222, 33, '이길영', 'm', null, null, null, null, 'photo','90-02-22', 0);
insert into member values(33057, 900223, 33, '이길수', 'm', null, null, null, null, 'photo','90-02-23', 0);
insert into member values(33058, 900224, 33, '이민자', 'm', null, null, null, null, 'photo','90-02-24', 0);
insert into member values(33059, 900225, 33, '이사람', 'm', null, null, null, null, 'photo','90-02-25', 0);
insert into member values(33060, 900226, 33, '저사람', 'm', null, null, null, null, 'photo','90-02-26', 0);
insert into member values(33061, 900227, 33, '여기다', 'm', null, null, null, null, 'photo','90-02-27', 0);
insert into member values(33062, 900301, 33, '김가가', 'm', null, null, null, null, 'photo','90-03-01', 0);
insert into member values(33063, 900302, 33, '이나나', 'f', null, null, null, null, 'photo','90-03-02', 0);
insert into member values(33064, 900303, 33, '박다다', 'm', null, null, null, null, 'photo','90-03-03', 0);
insert into member values(33065, 900304, 33, '박종호', 'm', null, null, null, null, 'photo','90-03-04', 0);
insert into member values(33066, 900305, 33, '박길호', 'm', null, null, null, null, 'photo','90-03-05', 0);
insert into member values(33067, 900306, 33, '박상호', 'm', null, null, null, null, 'photo','90-03-06', 0);
insert into member values(33068, 900307, 33, '홍민호', 'm', null, null, null, null, 'photo','90-03-07', 0);
insert into member values(33069, 900308, 33, '홍준표', 'm', null, null, null, null, 'photo','90-03-08', 0);
insert into member values(33070, 900309, 33, '문재인', 'm', null, null, null, null, 'photo','90-03-09', 0);
insert into member values(33071, 900310, 33, '나경원', 'f', null, null, null, null, 'photo','90-03-10', 0);
insert into member values(33072, 900311, 33, '김대중', 'm', null, null, null, null, 'photo','90-03-11', 0);
insert into member values(33073, 900312, 33, '김민주', 'f', null, null, null, null, 'photo','90-03-12', 0);
insert into member values(33074, 900313, 33, '채연', 'f', null, null, null, null, 'photo','90-03-13', 0);
insert into member values(33075, 900314, 33, '윤아', 'f', null, null, null, null, 'photo','90-03-14', 0);
insert into member values(33076, 900315, 33, '쯔위', 'f', null, null, null, null, 'photo','90-03-15', 0);
insert into member values(33077, 900316, 33, '휘성', 'm', null, null, null, null, 'photo','90-03-16', 0);
insert into member values(33078, 900317, 33, '아이유', 'f', null, null, null, null, 'photo','90-03-17', 0);
insert into member values(33079, 900318, 33, '배수지', 'f', null, null, null, null, 'photo','90-03-18', 0);
insert into member values(33080, 900319, 33, '정우성', 'm', null, null, null, null, 'photo','90-03-19', 0);
insert into member values(33081, 900320, 33, '이재용', 'm', null, null, null, null, 'photo','90-03-20', 0);
insert into member values(33082, 900321, 33, '이건희', 'm', null, null, null, null, 'photo','90-03-21', 0);
insert into member values(33083, 900322, 33, '권윤정', 'f', null, null, null, null, 'photo','90-03-22', 0);
insert into member values(33084, 900323, 33, '권용현', 'm', null, null, null, null, 'photo','90-03-23', 0);
insert into member values(33085, 900324, 33, '박기정', 'm', null, null, null, null, 'photo','90-03-24', 0);
insert into member values(33086, 900325, 33, '허준영', 'm', null, null, null, null, 'photo','90-03-25', 0);
insert into member values(33087, 900326, 33, '김용범', 'm', null, null, null, null, 'photo','90-03-26', 0);
insert into member values(33088, 900327, 33, '김용일', 'm', null, null, null, null, 'photo','90-03-27', 0);
insert into member values(33089, 900328, 33, '김세영', 'm', null, null, null, null, 'photo','90-03-28', 0);
insert into member values(33090, 900329, 33, '김민석', 'm', null, null, null, null, 'photo','90-03-29', 0);
insert into member values(33091, 900330, 33, '박기춘', 'm', null, null, null, null, 'photo','90-03-30', 0);
insert into member values(33092, 900331, 33, '박래훈', 'm', null, null, null, null, 'photo','90-03-31', 0);
insert into member values(33093, 900401, 33, '박보윤', 'f', null, null, null, null, 'photo','90-04-01', 0);
insert into member values(33094, 900402, 33, '박의규', 'm', null, null, null, null, 'photo','90-04-02', 0);
insert into member values(33095, 900403, 33, '백지은', 'f', null, null, null, null, 'photo','90-04-03', 0);
insert into member values(33096, 900404, 33, '진범근', 'm', null, null, null, null, 'photo','90-04-04', 0);
insert into member values(33097, 900405, 33, '변진석', 'm', null, null, null, null, 'photo','90-04-05', 0);
insert into member values(33098, 900406, 33, '성무진', 'm', null, null, null, null, 'photo','90-04-06', 0);
insert into member values(33099, 900407, 33, '성철호', 'm', null, null, null, null, 'photo','90-04-07', 0);
insert into member values(33100, 900408, 33, '송우연', 'm', null, null, null, null, 'photo','90-04-08', 0);
insert into member values(33101, 900409, 33, '권순민', 'm', null, null, null, null, 'photo','90-04-09', 0);
insert into member values(33102, 900410, 33, '심정훈', 'm', null, null, null, null, 'photo','90-04-10', 0);
insert into member values(33103, 900411, 33, '이승무', 'f', null, null, null, null, 'photo','90-04-11', 0);
insert into member values(33104, 900412, 33, '이길아', 'f', null, null, null, null, 'photo','90-04-12', 0);
insert into member values(33105, 900413, 33, '함종수', 'm', null, null, null, null, 'photo','90-04-13', 0);
insert into member values(33106, 900414, 33, '지현수', 'm', null, null, null, null, 'photo','90-04-14', 0);
insert into member values(33107, 900415, 33, '김태준', 'f', null, null, null, null, 'photo','90-04-15', 0);

-- 3. 강의실

CREATE TABLE classroom
(
	num number primary key,
	name varchar2(40) not null,
	width number default 0,
	height number default 0,
	party_num number REFERENCES party(party_num)
);

-- 3.1 강의실 더미데이터
insert into classroom values(1, '1강의실', 0,0,0);
insert into classroom values(2, '2강의실', 0,0,0);
insert into classroom values(3, '3강의실', 0,0,0);
insert into classroom values(4, '4강의실', 0,0,0);
insert into classroom values(5, '5강의실', 0,0,0);
insert into classroom values(6, '6강의실', 0,0,0);
insert into classroom values(7, '7강의실', 0,0,0);
insert into classroom values(8, '8강의실', 0,0,0);
insert into classroom values(9, '9강의실', 0,0,0);
insert into classroom values(10, '10강의실', 0,0,0);
insert into classroom values(11, '11강의실', 0,0,0);
insert into classroom values(12, '12강의실', 0,0,0);

-- 4. 강의실 상태

CREATE TABLE room_status
(
	classroom_num number REFERENCES classroom(num),
	seat number primary key,
	serviceable number default 0	
);

commit;

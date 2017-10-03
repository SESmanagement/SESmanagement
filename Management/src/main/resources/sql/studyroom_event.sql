**테이블 초기화
DROP TABLE STUDYROOM;
DROP TABLE SR_RESERVATION;
DROP TABLE SR_FACILITY;
DROP TABLE EVENT;
DROP SEQUENCE SRR_SEQ;
DROP SEQUENCE EV_SEQ;

**StudyRoom DB관련
CREATE TABLE STUDYROOM
(
	STUDYROOM_NUM NUMBER NOT NULL,
	SR_SEAT_NUM NUMBER NOT NULL,
	SEATED_STATUS NUMBER DEFAULT 0,
	ROOM_X NUMBER NOT NULL,
	ROOM_Y NUMBER NOT NULL,
	SEAT_X NUMBER NOT NULL,
	SEAT_Y NUMBER NOT NULL,
	ACTIVATE NUMBER,
	CONSTRAINT STUDYROOM_PK PRIMARY KEY(STUDYROOM_NUM, SR_SEAT_NUM)
);

//StyduRoom 더미데이터
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (16,1,null,7,4,1,1,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,1,null,1,3,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,2,null,1,3,5,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,1,null,1,4,3,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,2,null,1,4,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,2,null,2,1,5,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,1,null,2,1,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,3,null,2,2,5,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,2,null,2,4,4,1,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,2,null,2,5,7,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,3,null,2,1,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (12,2,null,5,1,6,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,2,null,6,1,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,2,null,7,1,6,3,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,6,null,1,1,6,5,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,5,null,1,1,7,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,7,null,1,1,5,5,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,8,null,1,1,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,9,null,1,1,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,5,null,1,2,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,6,null,1,2,6,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,7,null,1,2,4,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,8,null,1,2,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,9,null,1,2,3,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,10,null,1,2,3,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,3,null,1,3,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,4,null,1,3,7,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,5,null,1,3,8,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,6,null,1,3,8,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,7,null,1,3,8,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,8,null,1,3,8,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,9,null,1,3,7,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,10,null,1,3,6,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,11,null,1,3,3,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,12,null,1,3,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,13,null,1,3,3,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (3,14,null,1,3,3,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,4,null,2,1,7,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,5,null,2,1,8,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,6,null,2,1,8,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,7,null,2,1,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,8,null,2,1,6,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,9,null,2,1,5,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,10,null,2,1,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,11,null,2,1,3,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (6,12,null,2,1,3,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,4,null,2,2,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,2,null,2,2,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,5,null,2,2,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,6,null,2,2,7,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,7,null,2,2,8,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,8,null,2,2,6,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,9,null,2,2,5,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,10,null,2,2,4,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,11,null,2,2,3,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,12,null,2,2,2,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,13,null,2,2,2,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,14,null,2,2,2,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,15,null,2,2,2,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,2,null,2,3,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,3,null,2,3,5,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,4,null,2,3,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,5,1,2,3,7,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,6,null,2,3,7,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,7,null,2,3,6,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,8,null,2,3,5,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,9,null,2,3,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,10,null,2,3,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,11,null,2,3,2,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,12,null,2,3,2,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (8,1,null,2,3,3,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,3,null,2,4,5,1,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,4,null,2,4,6,1,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,5,null,2,4,7,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,6,null,2,4,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,7,null,2,4,6,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,8,null,2,4,5,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,9,null,2,4,4,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,10,null,2,4,3,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,11,null,2,4,2,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,12,null,2,4,2,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,13,null,2,4,2,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,14,null,2,4,2,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (9,1,null,2,4,3,1,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,3,null,2,5,8,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,4,null,2,5,7,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,5,null,2,5,8,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,6,null,2,5,7,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,7,null,2,5,8,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,8,null,2,5,8,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,9,null,2,5,3,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,10,null,2,5,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,11,null,2,5,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,12,null,2,5,4,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,13,null,2,5,3,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,14,null,2,5,4,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,15,null,2,5,3,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (10,1,null,2,5,3,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,2,null,4,1,4,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,3,null,4,1,5,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,4,null,4,1,6,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,5,null,4,1,5,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,6,null,4,1,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,7,null,4,1,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (11,1,null,4,1,3,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (12,3,null,5,1,7,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (12,4,null,5,1,6,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (12,5,null,5,1,5,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (12,6,null,5,1,4,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (12,1,null,5,1,5,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,3,null,6,1,5,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,4,null,6,1,4,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,5,null,6,1,3,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,6,null,6,1,6,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,7,null,6,1,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,8,null,6,1,8,6,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,9,null,6,1,7,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,10,null,6,1,6,7,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (13,1,null,6,1,3,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,3,null,7,1,7,3,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,4,null,7,1,7,5,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,5,null,7,1,6,5,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,6,null,7,1,5,5,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,7,null,7,1,4,6,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (14,1,null,7,1,5,3,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,4,null,1,4,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,5,null,1,4,7,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,3,null,1,4,5,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,6,null,1,4,8,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,1,null,1,1,3,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,2,null,1,1,4,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,3,null,1,1,5,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (1,4,null,1,1,6,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,1,2,1,2,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,2,null,1,2,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,3,null,1,2,7,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (2,4,null,1,2,7,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (15,1,null,7,5,1,1,0);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (7,1,null,2,2,3,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,8,null,1,4,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,7,null,1,4,8,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,9,null,1,4,6,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,10,null,1,4,5,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,11,null,1,4,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,12,null,1,4,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,13,null,1,4,2,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (4,14,null,1,4,2,3,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,1,null,1,5,3,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,7,null,1,5,8,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,3,null,1,5,5,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,4,null,1,5,6,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,5,null,1,5,7,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,6,null,1,5,8,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,2,null,1,5,4,2,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,8,null,1,5,7,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,9,null,1,5,6,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,10,null,1,5,5,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,11,null,1,5,4,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,12,null,1,5,3,5,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,13,null,1,5,2,4,1);
Insert into HR.STUDYROOM (STUDYROOM_NUM,SR_SEAT_NUM,SEATED_STATUS,ROOM_X,ROOM_Y,SEAT_X,SEAT_Y,ACTIVATE) values (5,14,null,1,5,2,3,1);



**StudyRoom Reservation DB관련
// 20170824 TEST용 테이블 임시 생성 (학생번호 추가)
CREATE TABLE SR_RESERVATION	
(	
	SR_RESV_NUM VARCHAR2(10) PRIMARY KEY,
	STUDYROOM_NUM NUMBER NOT NULL, 
	SR_SEAT_NUM NUMBER NOT NULL,
	STUDENT_NUM NUMBER REFERENCES MEMBER(STUDENT_NUM) NOT NULL,
	START_TIME TIMESTAMP NOT NULL,
	END_TIME TIMESTAMP NOT NULL
);

// 2017-09-01 SR_RESERVATION 테이블의 페이크 데이터 - 테이블 EMPTY 방지
INSERT INTO SR_RESERVATION VALUES (
'SRR000', 1, 1, 1, '70-01-01 00:00:00', '70-01-01 00:00:00');

// SR_RESV_NUM의 시퀀스 생성 (예약일련번호 : "SRR"+SRR_SEQ.NEXTVAL)
CREATE SEQUENCE SRR_SEQ;

// 2017-09-05 SR_FACILITY 테이블 생성 (문, 칠판, 콘센트 등 스터디룸 부가시설 표시)
CREATE TABLE SR_FACILITY 
(
	STUDYROOM_NUM NUMBER NOT NULL,
	FACILITY_NUMBER NUMBER DEFAULT 0,
	FACILITY_NAME VARCHAR2(50),
	SEAT_X NUMBER NOT NULL,
	SEAT_Y NUMBER NOT NULL,
	ACTIVATE NUMBER DEFAULT 1 NOT NULL
);

//SR_FACILITY 더미데이터
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (1,0,'문',1,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (1,0,'스크린',1,4,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (1,0,'콘센트',3,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (1,0,'콘센트',5,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (2,0,'문',1,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (2,0,'칠판',1,4,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (2,0,'콘센트',8,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (2,0,'콘센트',8,5,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (4,0,'칠판',3,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (4,0,'칠판',6,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (5,0,'칠판',3,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (6,0,'콘센트',9,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (9,0,'칠판',8,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (6,0,'칠판',10,4,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (6,0,'콘센트',2,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (7,0,'콘센트',8,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (8,0,'콘센트',4,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (8,0,'콘센트',6,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (8,0,'칠판',9,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (8,0,'문',1,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (7,0,'칠판',10,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (9,0,'콘센트',2,7,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (9,0,'문',1,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (10,0,'문',6,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (10,0,'칠판',5,7,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (10,0,'콘센트',9,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (10,0,'문',1,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (11,0,'콘센트',2,5,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (11,0,'칠판',3,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (11,0,'칠판',8,5,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (12,0,'칠판',7,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (11,0,'문',7,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (12,0,'문',4,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (12,0,'콘센트',6,6,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (12,0,'콘센트',8,5,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (13,0,'문',7,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (13,0,'칠판',9,5,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (14,0,'문',4,2,0);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (14,0,'칠판',2,3,0);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (4,0,'콘센트',9,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (6,0,'문',1,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (7,0,'문',1,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (3,0,'칠판',2,5,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (3,0,'칠판',2,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (3,0,'문',8,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (4,0,'콘센트',1,4,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (4,0,'칠판',1,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (4,0,'문',2,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (5,0,'콘센트',9,2,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (5,0,'문',2,1,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (5,0,'칠판',1,3,1);
Insert into SR_FACILITY (STUDYROOM_NUM,FACILITY_NUMBER,FACILITY_NAME,SEAT_X,SEAT_Y,ACTIVATE) values (5,0,'콘센트',1,4,1);


// 2017-09-20 EVENT 테이블 생성 (스케줄링)
CREATE TABLE EVENT 
(
	STUDENT_NUM NUMBER REFERENCES MEMBER(STUDENT_NUM),
	MEMO VARCHAR2(50),
	ID VARCHAR2(50) PRIMARY KEY,
	TITLE VARCHAR2(50) NOT NULL,
	ALLDAY NUMBER(1),
	START_TIME TIMESTAMP NOT NULL,
	END_TIME TIMESTAMP NOT NULL,
	URL_STR VARCHAR2(100),
	CLASSNAME VARCHAR2(100),
	EDITABLE NUMBER(1),
	STARTEDITABLE NUMBER(1),
	DURATIONEDITABLE NUMBER(1),
	RESOURCEEDITABLE NUMBER(1),
	RENDERING VARCHAR2(50),
	OVERLAP NUMBER(1),
 	CONSTRAINT_EVENT NUMBER(1),
	SOURCE_EVENT VARCHAR2(50),
	BACKGROUNDCOLOR VARCHAR2(50),
	BORDERCOLOR VARCHAR2(50),
	TEXTCOLOR VARCHAR2(50),
	REFERENCE VARCHAR2(50),
	PARTY_NUM NUMBER
);

// 스케줄링의 ID의 시퀀스 생성 (이벤트일련번호 : "EV"+EV_SEQ.NEXTVAL)
CREATE SEQUENCE EV_SEQ;

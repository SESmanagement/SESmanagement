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

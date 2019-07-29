DROP TABLE breed_pedia;
DROP TABLE files;
DROP TABLE report;
DROP TABLE cart;
DROP TABLE message;
DROP TABLE orders;
DROP TABLE apply;
DROP TABLE interest;
DROP TABLE review;
DROP TABLE recomment;
DROP TABLE participate;
DROP TABLE coupon;
DROP TABLE mileage;
DROP TABLE adopt;
DROP TABLE storyfunding;
DROP TABLE board;
DROP TABLE comments;
DROP TABLE users_access;
DROP TABLE users;
DROP TABLE product;

DROP SEQUENCE seq_USERS_USER_NO;
DROP SEQUENCE seq_PRODUCT_PROD_NO;
DROP SEQUENCE seq_BREED_PEDIA_BREED_NO;
DROP SEQUENCE seq_FILES_FILE_NO;

DROP SEQUENCE seq_COUPON_COUPON_NO;
DROP SEQUENCE seq_REPORT_REPORT_NO;
DROP SEQUENCE seq_MILEAGE_MILEAGE_NO;
DROP SEQUENCE seq_ADOPT_POST_NO;
DROP SEQUENCE seq_CART_CART_NO;
DROP SEQUENCE seq_STORYFUNDING_POST_NO;
DROP SEQUENCE seq_MESSAGE_MESSAGE_NO;

DROP SEQUENCE seq_ORDERS_ORDER_NO;
DROP SEQUENCE seq_APPLY_APPLY_NO;
DROP SEQUENCE seq_BOARD_POST_NO;

DROP SEQUENCE seq_INTEREST_INTEREST_NO;
DROP SEQUENCE seq_COMMENTS_COMMENT_NO;
DROP SEQUENCE seq_REVIEW_POST_NO;
DROP SEQUENCE seq_RECOMMENT_RECOMMENT_NO;

DROP SEQUENCE seq_PARTICIPATE_PARTICIPATE_NO;
DROP SEQUENCE seq_USERS_ACCESS_ACCESS_NO;



CREATE SEQUENCE seq_USERS_USER_NO 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_PRODUCT_PROD_NO 	 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_BREED_PEDIA_BREED_NO 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_FILES_FILE_NO	 			INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_COUPON_COUPON_NO	 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_REPORT_REPORT_NO	 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_MILEAGE_MILEAGE_NO			INCREMENT BY 1 START WITH 10000;	
CREATE SEQUENCE seq_ADOPT_POST_NO	 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_CART_CART_NO	 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_STORYFUNDING_POST_NO 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_MESSAGE_MESSAGE_NO 		INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_ORDERS_ORDER_NO 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_APPLY_APPLY_NO 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_BOARD_POST_NO 			INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_INTEREST_INTEREST_NO 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_COMMENTS_COMMENT_NO 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_REVIEW_POST_NO 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_RECOMMENT_RECOMMENT_NO 		INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_PARTICIPATE_PARTICIPATE_NO 		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_USERS_ACCESS_ACCESS_NO 		INCREMENT BY 1 START WITH 10000;


CREATE TABLE USERS ( 
	USER_NO			NUMBER(6,0) 	NOT NULL, 
	ID 			VARCHAR2(12) 	NOT NULL UNIQUE,
	KAKAO			VARCHAR2(100)	UNIQUE,
	NAVER			VARCHAR2(100)	UNIQUE,
	GOOGLE			VARCHAR2(100)	UNIQUE,
	FACEBOOK		VARCHAR2(100)	UNIQUE,
	PW 			VARCHAR2(15) 		NOT NULL,
	USER_NAME 		VARCHAR2(10) 	NOT NULL,
	NICKNAME 		VARCHAR2(14)	NOT NULL UNIQUE,
	EMAIL 			VARCHAR2(100),
	PHONE 			VARCHAR2(13) 	UNIQUE,
	USER_ADDR 		VARCHAR2(1000),
	ACCOUNT 		VARCHAR2(30),
	BIRTH_DATE 		NUMBER(6,0), 
	GENDER			CHAR(1) 		DEFAULT 0, 
	LEVEL_POINT 		NUMBER(4,0), 
	ACCESS_DATE 		DATE, 
	ACCESS_IP 		VARCHAR2(100),
	ROLE			VARCHAR2(10)	DEFAULT 'user',  
	PURPOSE1		VARCHAR2(50), 
	PURPOSE2		VARCHAR2(50),
	PURPOSE3		VARCHAR2(50),
	PROFILE			VARCHAR2(100),
	PRIMARY KEY(USER_NO));

CREATE TABLE PRODUCT (
	PROD_NO 		NUMBER(6,0) 	NOT NULL,
	PROD_NAME 		VARCHAR2(150) 	NOT NULL, 
	PRICE 			NUMBER(10,0) 	NOT NULL, 
	MANU_DATE 		DATE 		NOT NULL, 
	REG_DATE 		DATE 		NOT NULL, 
	COUNTRY 		VARCHAR2(50), 
	QUANTITY 		NUMBER(6,0) 	DEFAULT 0, 
	PROD_DETAIL 		VARCHAR2(4000) 	NOT NULL, 
	COMPANY 		VARCHAR2(100) 	NOT NULL, 
	DISCOUNT_PRICE 		NUMBER(10,0) 	NOT NULL, 
	PROD_CODE      		NUMBER(2,0),
	MAIN_FILE 		VARCHAR2(100),
	PRIMARY KEY(PROD_NO));

CREATE TABLE BREED_PEDIA (
   	BREED_NO		NUMBER(6,0)	 NOT NULL, 
	WEIGHT 			FLOAT		 NOT NULL, 
	HEIGHT 			FLOAT		 NOT NULL,
	AVG_LIFE 		NUMBER(2)	 NOT NULL, 
	ADD_INFO 		VARCHAR2(1000),
	TYPES 			VARCHAR2(100)	 NOT NULL, 
	CHARACTERS 		VARCHAR2(500)	 NOT NULL, 
	FILES 			VARCHAR2(100)	 NOT NULL, 
	NAME 			VARCHAR2(100)	 NOT NULL, 
	PRIMARY KEY (BREED_NO));
	
CREATE TABLE FILES (
	FILE_NO 			NUMBER(6,0) 	NOT NULL ENABLE, 
	BOARD_CODE 		CHAR(2) 		NOT NULL, 
	POST_NO 		NUMBER(6,0) 	NOT NULL, 
	FILE_NAME 		VARCHAR2(100) 	NOT NULL, 
	FILE_CODE 		CHAR(1) 		NOT NULL,
	PRIMARY KEY(FILE_NO));

CREATE TABLE COUPON (
	COUPON_NO 		NUMBER(6,0) 	NOT NULL,
	COUPON_CODE 		VARCHAR2(10) 	NOT NULL,
	RECEIVER_ID 		VARCHAR2(12) 	REFERENCES USERS(ID),
	COUPON_NAME 		VARCHAR2(50)  	NOT NULL,
	DISCOUNT 		NUMBER(5,0)  	NOT NULL,
	IMAGE 			VARCHAR2(100) 	NOT NULL,
	COUPON_STATUS 		CHAR(1),
	MAKE_DATE 		DATE,
	LIMIT_DATE 		DATE,
	USE_DATE		DATE,
	PRIMARY KEY(COUPON_NO));

CREATE TABLE REPORT (
 	REPORT_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	REPORTER_ID 		VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID),
	REPORTED_ID 		VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID),
	REPORT_CATEGORY 	VARCHAR2(20) 	NOT NULL ENABLE, 
	REPORT_CONTENT 	VARCHAR2(2000) 	NOT NULL ENABLE, 
	REPORT_STATUS 		NUMBER(1,0) 	NOT NULL ENABLE,
	REPORT_DATE		DATE,
	DEL_CODE 		CHAR(1),
	FILE1			VARCHAR2(100)	NOT NULL ENABLE,
	FILE2			VARCHAR2(100),
	FILE3			VARCHAR2(100),
	PRIMARY KEY (REPORT_NO));

CREATE TABLE MILEAGE (
	MILEAGE_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	MILEAGE_CODE 		NUMBER(3,0), 
	MILEAGE 			NUMBER(7,0) 	DEFAULT 0, 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	MILEAGE_REASON 		VARCHAR2(200) 	NOT NULL, 
	REG_DATE 		DATE, 
	PRIMARY KEY (MILEAGE_NO));
	
CREATE TABLE ADOPT(
   	BOARD_CODE 		CHAR(2) 		NOT NULL ENABLE, 
	POST_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	POST_TITLE 		VARCHAR2(30) 	NOT NULL ENABLE, 
	POST_CONTENT 		VARCHAR2(600) 	NOT NULL ENABLE, 
	PHONE 			VARCHAR2(13) 	NOT NULL ENABLE, 
	ADOPT_AREA 		VARCHAR2(200) , 
	AREA_KR 		VARCHAR2(200) , 
	LOCATION 		VARCHAR2(100) 	NOT NULL ENABLE, 
	LOCATION_KR 		VARCHAR2(100) 	NOT NULL ENABLE, 
	REG_DATE 		DATE 		NOT NULL ENABLE, 
	DOG_BREED 		VARCHAR2(30), 
	DOG_WEIGHT 		VARCHAR2(6) 	NOT NULL ENABLE, 
	DOG_SIZE 		VARCHAR2(10) 	NOT NULL ENABLE, 
	DOG_GENDER 		VARCHAR2(10) 	NOT NULL ENABLE, 
	DOG_PAY 		NUMBER(6,0)	NOT NULL ENABLE, 
	DOG_STATUS 		VARCHAR2(60) 	NOT NULL ENABLE, 
	DOG_CHAR 		VARCHAR2(60) 	NOT NULL ENABLE, 
	DOG_PERSONALITY 	VARCHAR2(60) 	NOT NULL ENABLE, 
	DOG_DATE 		DATE 		NOT NULL ENABLE, 
	MAIN_FILE     		VARCHAR2(100)    NOT NULL,
	STATUS_CODE 		CHAR(1) 		NOT NULL ENABLE, 
	PRIMARY KEY (POST_NO));
	
CREATE TABLE CART (
   	CART_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	PROD_NO 		NUMBER(6) 	REFERENCES PRODUCT(PROD_NO), 
	TOTAL_PRICE 		NUMBER(10,0),  
	QUANTITY 		NUMBER(6,0) 	DEFAULT 1, 
	ID 			VARCHAR2(12) 	REFERENCES USERS(ID), 
	PRIMARY KEY (CART_NO));
	
CREATE TABLE STORYFUNDING(   
	POST_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	NICKNAME 		VARCHAR2(14) 	NOT NULL ENABLE,
	STATUS_CODE 		CHAR(1) 		NOT NULL ENABLE, 
	PHONE 			VARCHAR2(13) 	NOT NULL ENABLE, 
	POST_TITLE 		VARCHAR2(50) 	NOT NULL ENABLE, 
	POST_CONTENT 		VARCHAR2(600)    NOT NULL ENABLE, 
	VOTE_VIEW_COUNT 	NUMBER(5,0) 	DEFAULT 0 NOT NULL ENABLE, 
	VOTER_COUNT 		NUMBER(5,0) 	DEFAULT 0 NOT NULL ENABLE, 
	VOTE_START_DATE 	DATE 		NOT NULL ENABLE, 
	VOTE_END_DATE 		DATE 		NOT NULL ENABLE, 
	FUND_TARGET_PAY 	NUMBER(7,0) 	NOT NULL ENABLE,
	VOTE_TARGET_COUNT 	NUMBER(5,0) 	NOT NULL ENABLE, 
	FUND_TARGET_DAY 	NUMBER(2,0) 	NOT NULL ENABLE, 
	FUND_VIEW_COUNT 	NUMBER(5,0) 	DEFAULT 0 NOT NULL ENABLE,
	SPONSOR_COUNT 		NUMBER(5,0) 	DEFAULT 0 NOT NULL ENABLE, 
	FUND_PAY 		NUMBER(10,0) 	DEFAULT 0 NOT NULL ENABLE, 
	FUND_START_DATE 	DATE,    
	FUND_END_DATE 		DATE,
	REVIEW_TITLE 		VARCHAR(50),
	REVIEW_CONTENT 		VARCHAR(600),
	REVIEW_REG_DATE 	DATE,
 	MAIN_FILE 		VARCHAR2(100) 	NOT NULL,
	PRIMARY KEY (POST_NO));

CREATE TABLE MESSAGE (
   	MESSAGE_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	MESSAGE_TITLE 		VARCHAR2(200) 	NOT NULL ENABLE, 
	MESSAGE_CONTENT 	VARCHAR2(2000) 	NOT NULL ENABLE, 
	SENDER_ID 		VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	RECEIVER_ID 		VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	SEND_DATE 		DATE, 
	RECEIVE_DATE 		DATE, 
	MESSAGE_STATUS 		CHAR(1) 		NOT NULL ENABLE, 
	DEL_CODE 		CHAR(1) 		NOT NULL,
	PRIMARY KEY (MESSAGE_NO));

	 
CREATE TABLE ORDERS (
   	ORDER_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	PROD_NO 		NUMBER(6,0) 	REFERENCES PRODUCT(PROD_NO) NOT NULL, 
	ID 			VARCHAR2(12) 	REFERENCES USERS(ID) NOT NULL, 
	PHONE 			VARCHAR2(13),
	RECEIVER_ADDR 		VARCHAR2(100) 	NOT NULL, 
	RECEIVER_NAME 		VARCHAR2(50) 	NOT NULL, 
	RECEIVER_PHONE 		VARCHAR2(13) 	NOT NULL, 
	ORDER_REQUEST 		VARCHAR2(40), 
	PAYMENT_CODE 		NUMBER(2,0) 	NOT NULL, 
	ORDER_DATE 		DATE, 
	COUPON_NO 		NUMBER(6,0) 	REFERENCES COUPON(COUPON_NO), 
	ORDER_QUANTITY 		NUMBER(6,0) 	NOT NULL,  
	TOTAL_PRICE 		NUMBER(10,0) 	NOT NULL, 
	ORDER_CODE 		NUMBER(2,0) 	DEFAULT 0,  
	DELIVERY_CODE 		NUMBER(7,0),
 	MILEAGE_NO 		NUMBER(6,0) 	REFERENCES MILEAGE(MILEAGE_NO),  
	PRIMARY KEY (ORDER_NO));
	 

CREATE TABLE APPLY (
   	APPLY_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	ADOPT_NO 		NUMBER(6,0) 	NOT NULL ENABLE REFERENCES ADOPT(POST_NO), 
	ID 				VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	PHONE 			VARCHAR2(13) 	NOT NULL ENABLE, 
	JOB 			VARCHAR2(10) 	NOT NULL ENABLE, 
	ADDR 			VARCHAR2(10) 	NOT NULL ENABLE, 
	MATE 			VARCHAR2(10) 	NOT NULL ENABLE, 
	MATE_AGREE 		VARCHAR2(30), 
	RAISE 			VARCHAR2(10) 	NOT NULL ENABLE, 
	CURRENTLY 		VARCHAR2(30), 
	PLAN 			VARCHAR2(900) 	NOT NULL ENABLE, 
	PAY 			VARCHAR2(900) 	NOT NULL ENABLE, 
	REASON 			VARCHAR2(900) 	NOT NULL ENABLE, 
	SITUATION 		VARCHAR2(900) 	NOT NULL ENABLE, 
	REG_DATE 		DATE 		NOT NULL ENABLE, 
	STATUS_CODE 	CHAR(1) 		DEFAULT '1' NOT NULL ENABLE,
	PRIMARY KEY (APPLY_NO));
	 

CREATE TABLE BOARD (
   	POST_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	BOARD_CODE 		CHAR(2) 		NOT NULL ENABLE, 
	ID 				VARCHAR2(12) 	NOT NULL ENABLE  REFERENCES USERS(ID), 
	NICKNAME 		VARCHAR2(14) 	NOT NULL ENABLE, 
	POST_TITLE 		VARCHAR2(30) 	NOT NULL ENABLE, 
	POST_CONTENT 	CLOB	 		NOT NULL ENABLE, 
	REG_DATE 		DATE 			NOT NULL ENABLE, 
	VIEW_COUNT 		NUMBER(5,0) 	DEFAULT 0 NOT NULL ENABLE, 
	RECOMMEND_COUNT NUMBER(5,0), 
	MARKET_CODE 	NUMBER(2,0), 
	PRICE 			NUMBER(10,0), 
	CITY 			VARCHAR2(100), 
	PHONE 			VARCHAR2(13), 
	QNA_CODE 		CHAR(2), 
	ROUTE 			VARCHAR2(250), 
	PROD_NO			NUMBER(6,0)		REFERENCES PRODUCT(PROD_NO),
	PROD_NAME 		VARCHAR2(15),
	DEL_CODE		CHAR(1)			DEFAULT '1',
	THUMNAIL		CLOB,	
	PRIMARY KEY (POST_NO));

CREATE TABLE PARTICIPATE (
	PARTICIPATE_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	NICKNAME 		VARCHAR2(14) 	NOT NULL,
	POST_NO 		NUMBER(6,0) 	NOT NULL ENABLE REFERENCES STORYFUNDING(POST_NO), 
	REG_DATE 		DATE 		NOT NULL ENABLE, 
	FUND_PAY 		NUMBER(7,0), 
	STATUS_CODE 		CHAR(1) 		NOT NULL ENABLE,
	PAYMENT_CODE     	VARCHAR2(10),
	PRIMARY KEY (PARTICIPATE_NO));
	 
CREATE TABLE COMMENTS (
   	COMMENT_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	BOARD_CODE 		CHAR(2) 		NOT NULL ENABLE, 
	POST_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE, 
	COMMENT_CONTENT 	VARCHAR2(400) 	NOT NULL ENABLE, 
	REG_DATE 		DATE 		NOT NULL ENABLE, 
	LIKE_COUNT 		NUMBER(4,0) 	NOT NULL ENABLE, 
	NICKNAME 		VARCHAR2(14) 	NOT NULL ENABLE, 
	STATUS_CODE		CHAR(1)		DEFAULT '1',
	PRIMARY KEY (COMMENT_NO));
	
CREATE TABLE INTEREST (
   	INTEREST_NO 		NUMBER(6,0), 
	BOARD_CODE 		CHAR(2), 
	COMMENT_NO 		NUMBER(6,0) 	REFERENCES COMMENTS(COMMENT_NO), 
	POST_NO 		NUMBER(6,0) 	REFERENCES BOARD(POST_NO), 
	ID 			VARCHAR2(12) 	REFERENCES USERS(ID), 
	REG_DATE 		DATE,
	PRIMARY KEY (INTEREST_NO));

CREATE TABLE REVIEW (
   	POST_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	BOARD_CODE 		CHAR(2) 		NOT NULL ENABLE, 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	NICKNAME 		VARCHAR2(14) 	NOT NULL ENABLE, 
	POST_TITLE 		VARCHAR2(30) 	NOT NULL ENABLE, 
	POST_CONTENT 		VARCHAR2(600) 	NOT NULL ENABLE, 
	REG_DATE 		DATE 		NOT NULL ENABLE, 
	HOSPITAL_NAME 		VARCHAR2(100), 
	GRADE 			NUMBER(1,0), 
	ORDER_NO 		NUMBER(6,0), 
	STATUS_CODE		CHAR(1)		DEFAULT '1',
	PRIMARY KEY (POST_NO));

CREATE TABLE RECOMMENT (
   	RECOMMENT_NO 		NUMBER(6,0) 	NOT NULL ENABLE, 
	COMMENT_NO 		NUMBER(6,0) 	NOT NULL ENABLE REFERENCES COMMENTS(COMMENT_NO), 
	ID 			VARCHAR2(12) 	NOT NULL ENABLE REFERENCES USERS(ID), 
	REG_DATE 		DATE 		NOT NULL ENABLE, 
	NICKNAME 		VARCHAR2(14) 	NOT NULL ENABLE, 
	RECOMMENT_CONTENT 	VARCHAR2(300) 	NOT NULL ENABLE,	
	STATUS_CODE		CHAR(1)		DEFAULT '1',
	POST_NO 		NUMBER(6) 	REFERENCES BOARD(POST_NO),
	PRIMARY KEY (RECOMMENT_NO));

CREATE TABLE USERS_ACCESS(
	ACCESS_NO 		NUMBER(6,0) 	NOT NULL ENABLE,
	ACCESS_ID 		VARCHAR2(12) 	REFERENCES USERS(id),
	ACCESS_DATE 		DATE,
	ACCESS_IP 		VARCHAR2(100),
	PRIMARY KEY(ACCESS_NO));





INSERT INTO users 
(user_no, id, pw, user_name, nickname, level_point, role)
VALUES 
(seq_users_user_no.NEXTVAL, 'admin', '12345678', 'admin', '운영자', 99999, 'admin');

INSERT INTO users
(user_no, id, pw, user_name, nickname, email, phone, user_addr, account, birth_date, level_point, gender, role, purpose1, purpose2)
VALUES
(seq_users_user_no.NEXTVAL, 'user01', '11111111', 'scott', '스캇', 'scott@tiger.com', '011-1123-4567', '서울시 성북구', '110-234-567890', '900314', '5600', 'm', 'user', '정보공유', '입양');

INSERT INTO users
(user_no, id, kakao, pw, user_name, nickname, level_point, role)
VALUES
(seq_users_user_no.NEXTVAL, 'user02', '29343041834', '22222222', 'tiger', '호랭이', 0, 'user');

INSERT INTO users
(user_no, id, naver, pw, user_name, nickname, email, phone, user_addr, account, birth_date, level_point, gender, role, purpose1)
VALUES 
(seq_users_user_no.NEXTVAL, 'user03', '123124124', '33333333', 'hello', '안녕', 'hello@tiger.com', '011-2123-4567', '서울시 성북구', '110-432-098765', 900314, 0, 'm', 'user', '입양');	 

INSERT INTO users 
(user_no, id, naver, pw, user_name, nickname, email, phone, user_addr, account, birth_date, level_point, gender, role, purpose1)
VALUES 
(seq_users_user_no.NEXTVAL, 'user04', '132456788', '12341234', 'hello', '신청자1', 'hello@tiger.com', '011-2123-4568', '서울시 성북구', '110-432-098765', 900314, 0, 'm', 'user', '입양');	 

INSERT INTO users 
(user_no, id, naver, pw, user_name, nickname, email, phone, user_addr, account, birth_date, level_point, gender, role, purpose1)
VALUES 
(seq_users_user_no.NEXTVAL, 'user05', '123456789', '12341234', 'hello', '신청자2', 'hello@tiger.com', '011-2123-4569', '서울시 성북구', '110-432-098765', 900314, 0, 'm', 'user', '입양');	 

INSERT INTO users 
(user_no, id, naver, pw, user_name, nickname, email, phone, user_addr, account, birth_date, level_point, gender, role, purpose1)
VALUES 
(seq_users_user_no.NEXTVAL, 'user06', '123456780', '12341234', 'hello', '신청자3', 'hello@tiger.com', '011-2123-4560', '서울시 성북구', '110-432-098765', 900314, 0, 'm', 'user', '입양');	 


INSERT INTO message
(message_no, message_title, message_content, sender_id, receiver_id, send_date, 
receive_date, message_status, del_code)
VALUES
(seq_message_message_no.NEXTVAL, '테스트1', '이거슨 테스트인 거시여1', 'user01', 'user02', SYSDATE, null, '0', '0');

INSERT INTO message
(message_no, message_title, message_content, sender_id, receiver_id, send_date, receive_date, message_status, del_code)
VALUES
(seq_message_message_no.NEXTVAL, '테스트2', '이거슨 테스트인 거시여2', 'user02', 'user01', SYSDATE, null, '0', '0');

INSERT INTO message
(message_no, message_title, message_content, sender_id, receiver_id, send_date, receive_date, message_status, del_code)
VALUES
(seq_message_message_no.NEXTVAL, '테스트3', '이거슨 테스트인 거시여3', 'user03', 'user01', SYSDATE, null, '0', '0');


INSERT 
INTO STORYFUNDING(
POST_NO , ID , NICKNAME , STATUS_CODE ,  PHONE ,  POST_TITLE , POST_CONTENT  ,VOTER_COUNT , VOTE_TARGET_COUNT,
VOTE_START_DATE,VOTE_END_DATE ,FUND_TARGET_PAY ,FUND_TARGET_DAY   ,MAIN_FILE)
VALUES ( 
SEQ_STORYFUNDING_POST_NO.NEXTVAL ,'user01' ,'스캇' ,1 ,'011-1123-4567' ,'강아지를도와주세요' ,'내용내용 도와주세용',0,10
, SYSDATE ,SYSDATE+29 ,100000,10, '05.jpg' );

INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10000 , '05.jpg' , 0);
INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10000 , '59584688_139489550543469_706907746533868336_n.jpg' , 0);

INSERT 
INTO STORYFUNDING(
POST_NO , ID , NICKNAME , STATUS_CODE ,  PHONE ,  POST_TITLE , POST_CONTENT  ,VOTER_COUNT , VOTE_TARGET_COUNT,VOTE_VIEW_COUNT,
VOTE_START_DATE,VOTE_END_DATE ,FUND_TARGET_PAY ,FUND_TARGET_DAY   ,MAIN_FILE)
VALUES ( 
SEQ_STORYFUNDING_POST_NO.NEXTVAL ,'user03' ,'안녕' ,2 ,'011-1123-4567' ,'많이 아파해요 ㅠㅠ' ,'내용내용 도와주세용',2,20,10
, '20190620' ,'20190721' ,200000,7, '14727754977_7469eea5fd_b.jpg' );

INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10001 , '14727754977_7469eea5fd_b.jpg' , 0);
INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10001 , '59584688_139489550543469_706907746533868336_n.jpg' , 0);

INSERT 
INTO STORYFUNDING(
POST_NO , ID , NICKNAME , STATUS_CODE ,  PHONE ,  POST_TITLE , POST_CONTENT  ,VOTER_COUNT , VOTE_TARGET_COUNT,VOTE_VIEW_COUNT,
VOTE_START_DATE,VOTE_END_DATE ,FUND_TARGET_PAY ,FUND_TARGET_DAY   ,MAIN_FILE ,FUND_START_DATE, FUND_END_DATE)
VALUES ( 
SEQ_STORYFUNDING_POST_NO.NEXTVAL ,'user03' ,'안녕' ,3 ,'011-1123-4567' ,'후원필요합니다....' ,'내용내용 도와주세용',20,20,50
, '20190620' ,'20190720' ,200000,20, '14727754977_7469eea5fd_b.jpg' , SYSDATE,  SYSDATE+20);

INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10002 , '14727754977_7469eea5fd_b.jpg' , 0);
INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10002 , '59584688_139489550543469_706907746533868336_n.jpg' , 0);

INSERT 
INTO STORYFUNDING(
POST_NO , ID , NICKNAME , STATUS_CODE ,  PHONE ,  POST_TITLE , POST_CONTENT  ,VOTER_COUNT , VOTE_TARGET_COUNT,VOTE_VIEW_COUNT,
VOTE_START_DATE,VOTE_END_DATE ,FUND_TARGET_PAY ,FUND_TARGET_DAY   ,MAIN_FILE ,FUND_START_DATE, FUND_END_DATE,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_REG_DATE,
FUND_VIEW_COUNT,SPONSOR_COUNT,FUND_PAY)
VALUES ( 
SEQ_STORYFUNDING_POST_NO.NEXTVAL ,'user01' ,'스캇' ,4 ,'011-1123-4567' ,'하퍼를후원해주세요..' ,'내용내용 도와주세용',200,200,50
, '20190520' ,'20190620' ,2000000,25, 'we.jpg' ,'20190621',  '20190715','덕분에 하퍼가 힘이났네요','감사합니다 정말로,,,ㅠㅠ',SYSDATE
,200,150,2000000);

INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10003 , 'we.jpg' , 0);
INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SF' , 10003 , '59584688_139489550543469_706907746533868336_n.jpg' , 0);
INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SR', 10003 , 'we.jpg' , 0);
INSERT INTO FILES(FILE_NO , BOARD_CODE  ,  POST_NO , FILE_NAME , FILE_CODE) VALUES(GET_FILE_NO() , 'SR' , 10003 , '59584688_139489550543469_706907746533868336_n.jpg' , 0);


INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10001 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10001 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10002 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10002 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10002 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10002 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10002 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10002 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10003 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10003 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10003 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10003 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10003 , '20190629' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10003 , '20190701' ,'1');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE,FUND_PAY,PAYMENT_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10003 , '20190629' ,'1',10000,'card');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE,FUND_PAY,PAYMENT_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10003 , '20190701' ,'1',20000,'trans');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE,FUND_PAY,PAYMENT_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10003 , '20190629' ,'1',100000,'card');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE,FUND_PAY,PAYMENT_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10003 , '20190701' ,'1',100000,'card');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE,FUND_PAY,PAYMENT_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user02' ,'호랭이' ,10003 , '20190629' ,'1',200000,'card');

INSERT
INTO PARTICIPATE( PARTICIPATE_NO , ID , NICKNAME , POST_NO , REG_DATE  , STATUS_CODE,FUND_PAY,PAYMENT_CODE)
VALUES (SEQ_PARTICIPATE_PARTICIPATE_NO.NEXTVAL ,'user03' ,'안녕' ,10003 , '20190701' ,'1',200000,'card'); 


INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요1', '내용', '011-2123-4567', '(38.073057724772966, 127.60071237487796)#','강원도 춘천시 사북면  ', '(37.87554821220492, 127.72001389255138)', '강원도 춘천시 중앙로', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '1.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요2', '내용', '011-2123-4567', '(37.43093975683735, 126.70944650573733)#','인천시 남동구 남촌동   ', '(37.5694426536982, 127.00127084655765)', '서울시 중구 청계천로 ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '2.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요3', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동  ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '3.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요4', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '4.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요5', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동   ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '5.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요6', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '6.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요7', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '7.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요8', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '8.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요9', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '9.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요10', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '10.jpg', '1');

INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요11', '내용', '011-2123-4567', '(38.073057724772966, 127.60071237487796)#','강원도 춘천시 사북면  ', '(37.87554821220492, 127.72001389255138)', '강원도 춘천시 중앙로', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '1.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요12', '내용', '011-2123-4567', '(37.43093975683735, 126.70944650573733)#','인천시 남동구 남촌동   ', '(37.5694426536982, 127.00127084655765)', '서울시 중구 청계천로 ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '2.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요13', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동  ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '3.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요14', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '4.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요15', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동   ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '5.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요16', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '6.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요17', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '7.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요18', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '8.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요19', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '9.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요20', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '10.jpg', '1');

INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요21', '내용', '011-2123-4567', '(38.073057724772966, 127.60071237487796)#','강원도 춘천시 사북면  ', '(37.87554821220492, 127.72001389255138)', '강원도 춘천시 중앙로', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '1.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요22', '내용', '011-2123-4567', '(37.43093975683735, 126.70944650573733)#','인천시 남동구 남촌동   ', '(37.5694426536982, 127.00127084655765)', '서울시 중구 청계천로 ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '2.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요23', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동  ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '3.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요24', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '4.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요25', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동   ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '5.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요26', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '6.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요27', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '7.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요28', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '8.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요29', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '9.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요30', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '10.jpg', '1');

INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요31', '내용', '011-2123-4567', '(38.073057724772966, 127.60071237487796)#','강원도 춘천시 사북면  ', '(37.87554821220492, 127.72001389255138)', '강원도 춘천시 중앙로', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '1.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요32', '내용', '011-2123-4567', '(37.43093975683735, 126.70944650573733)#','인천시 남동구 남촌동   ', '(37.5694426536982, 127.00127084655765)', '서울시 중구 청계천로 ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '2.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요33', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동  ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '3.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요34', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '4.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요35', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동   ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '5.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요36', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '6.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요37', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '7.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요38', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '8.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요39', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '9.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요40', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '10.jpg', '1');

INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요41', '내용', '011-2123-4567', '(38.073057724772966, 127.60071237487796)#','강원도 춘천시 사북면  ', '(37.87554821220492, 127.72001389255138)', '강원도 춘천시 중앙로', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '1.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요42', '내용', '011-2123-4567', '(37.43093975683735, 126.70944650573733)#','인천시 남동구 남촌동   ', '(37.5694426536982, 127.00127084655765)', '서울시 중구 청계천로 ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '2.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요43', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동  ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '3.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요44', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '4.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요45', '내용', '011-2123-4567', '(37.66897296720348, 126.85707528991702)#','경기도 고양시 덕양구 원당동   ', '(37.67087525369506, 126.85793359680179)', '경기도 고양시 덕양구 원당동', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '5.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요46', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '6.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요47', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '7.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요48', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '8.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요49', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '9.jpg', '1');
INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '강아지입양하세요50', '내용', '011-2123-4567', '(37.55991774875896, 126.99715097351077)#','서울시 중구 필동3가  ', '(37.566449243376184, 127.00109918518069)', '서울시 중구 필동3가  ', '2019-07-23', '시츄', '3', '소형견', '남아', '1000','상태', '특징', '성격', '2019-07-23', '10.jpg', '1');


		
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10000, '1.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10001, '2.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10002, '3.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10003, '4.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10004, '5.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10005, '6.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10006, '7.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10007, '8.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10008, '9.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10009, '10.jpg' , '0');

INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10010, '1.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10011, '2.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10012, '3.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10013, '4.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10014, '5.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10015, '6.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10016, '7.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10017, '8.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10018, '9.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10019, '10.jpg' , '0');

INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10020, '1.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10021, '2.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10022, '3.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10023, '4.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10024, '5.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10025, '6.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10026, '7.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10027, '8.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10028, '9.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10029, '10.jpg' , '0');

INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10030, '1.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10031, '2.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10032, '3.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10033, '4.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10034, '5.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10035, '6.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10036, '7.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10037, '8.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10038, '9.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10039, '10.jpg' , '0');

INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10040, '1.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10041, '2.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10042, '3.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10043, '4.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10044, '5.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10045, '6.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10046, '7.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10047, '8.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10048, '9.jpg' , '0');
INSERT INTO files (file_no, board_code, post_no,file_name,file_code ) VALUES (seq_files_file_no.nextval, 'AD', 10049, '10.jpg' , '0');


		
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10046, 'user04', '011-2123-4568', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10046, 'user05', '011-2123-4569', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10046, 'user06', '011-2123-4560', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10049, 'user04', '011-2123-4568', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10049, 'user05', '011-2123-4569', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10049, 'user06', '011-2123-4560', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10048, 'user04', '011-2123-4568', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10048, 'user05', '011-2123-4569', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10047, 'user05', '011-2123-4569', '학생', '아파트', '있음', '동의', '없음', '계획', '예상비용', '이유', '상황', SYSDATE  );

UPDATE adopt SET status_code = 3 where post_no = 10047;
UPDATE adopt SET status_code = 2 where post_no = 10046;
UPDATE adopt SET status_code = 2 where post_no = 10048;
UPDATE adopt SET status_code = 2 where post_no = 10049;
		
INSERT INTO BOARD 
(post_no, board_code, id, nickname, post_title, post_content, reg_date, view_count, recommend_count, route)
VALUES 
(15555, 'IS', 'user01', '스캇', 'InfoShareTestTitle' ,  'InfoShareTestContent' , SYSDATE , 1000, 1000, '37.499135, 127.022593');

INSERT INTO BOARD 
(post_no, board_code, id, nickname, post_title, post_content, reg_date, view_count, recommend_count, route)
VALUES 
(15556, 'IS', 'user02', '호랭이', 'InfoShareTestTitle1' ,  'InfoShareTestContent1' , SYSDATE , 1001, 1001, '38.499135, 128.022593');

INSERT INTO BOARD 
(post_no, board_code, id, nickname, post_title, post_content, reg_date, view_count, recommend_count, route)
VALUES 
(15557, 'IS', 'user03' , '안녕', 'InfoShareTestTitle2' ,  'InfoShareTestContent2' , SYSDATE , 1002, 1002, '39.499135, 129.022593');

INSERT INTO BOARD 
(POST_NO, BOARD_CODE, ID, NICKNAME, POST_TITLE, POST_CONTENT, REG_DATE, PRICE, PROD_NAME) 
VALUES 
(10099, 'MK', 'user01', '스캇', '마켓 제목1', '마켓 글내용1', '2015-07-21', '3000', '중고장터상품1');

INSERT INTO BOARD 
(POST_NO, BOARD_CODE, ID, NICKNAME, POST_TITLE, POST_CONTENT, REG_DATE, PRICE, PROD_NAME) 
VALUES 
(10098, 'MK', 'user01', '스캇', '마켓 제목2', '마켓 글내용2', '2015-07-11', '4000', '중고장터상품2');

INSERT INTO BOARD 
(POST_NO, BOARD_CODE, ID, NICKNAME, POST_TITLE, POST_CONTENT, REG_DATE, PRICE, PROD_NAME) 
VALUES 
(10097, 'MK', 'user01', '스캇', '마켓 제목3', '마켓 글내용3', '2015-07-10', '4500', '중고장터상품3');


INSERT INTO BREED_PEDIA( breed_no , weight , height , avg_life, add_Info, types, characters, files, name) 
VALUES( seq_BREED_PEDIA_BREED_NO.NEXTVAL, 15.0 , 35.0 , 11 , '사냥을 위해 태어난 개로 알려진 품종이다', '사냥','충성심이 강함, 애교가없음', 'abcde.jpg', '도베르만');

INSERT INTO BREED_PEDIA( breed_no , weight , height , avg_life, add_Info, types, characters, files, name) 
VALUES( seq_BREED_PEDIA_BREED_NO.NEXTVAL, 13.0 , 20.0 , 14 , '머리 좋기로 소문난 반려견', '반려', '주인을 잘 따름, 애교가많음, 똑똑함', 'fome.jpg', '포메라니안');

INSERT INTO BREED_PEDIA( breed_no , weight , height , avg_life, add_Info, types, characters, files, name)
VALUES( seq_BREED_PEDIA_BREED_NO.NEXTVAL, 22.0 , 20.0 , 14 , '머리는 크고 네모졌으며 코는 뭉뚝하다.', '반려', '고집이 쌤, 충섬심이 강함', 'bulldog.jpg', '불독'); 


INSERT INTO comments( comment_no, post_no, board_code, id, comment_content, reg_date, like_count, nickName) 
VALUES (seq_COMMENTS_COMMENT_NO.nextval, 15555, 'IS', 'user01', '1번 댓글선수 잘달립니다!!', sysdate, 0, '스캇');

INSERT INTO comments( comment_no, post_no, board_code, id, comment_content, reg_date, like_count, nickName) 
VALUES (seq_COMMENTS_COMMENT_NO.nextval, 15556, 'IS', 'user02', '그뒤를 잇는 2번 댓글선수!!', sysdate, 1, '호랭이');

INSERT INTO comments( comment_no, post_no, board_code, id, comment_content, reg_date, like_count, nickName) 
VALUES (seq_COMMENTS_COMMENT_NO.nextval, 15557, 'IS', 'user03', '맹추격합니다 3번 댓글선수!!', sysdate, 2, '안녕');

INSERT INTO recomment( comment_no, recomment_no, id, recomment_content, reg_date, nickName) 
VALUES (10000, seq_RECOMMENT_RECOMMENT_NO.NEXTVAL, 'user01', '1번 대댓글선수 잘 달리나요?!', sysdate, '스캇');

INSERT INTO recomment( comment_no, recomment_no, id, recomment_content, reg_date, nickName) 
VALUES (10001, seq_RECOMMENT_RECOMMENT_NO.NEXTVAL, 'user02', '2번 대댓글선수 잘 달리나요?!', sysdate, '호랭이');

INSERT INTO recomment( comment_no, recomment_no, id, recomment_content, reg_date, nickName) 
VALUES (10002, seq_RECOMMENT_RECOMMENT_NO.NEXTVAL, 'user03', '3번 대댓글선수 잘 달리나요?!', sysdate, '안녕');


INSERT INTO coupon
(coupon_no, coupon_code, coupon_name, discount, image, coupon_status, make_date, limit_date)
VALUES
(seq_coupon_coupon_no.NEXTVAL, 'LT93F22LX', '한계돌파5천원권', 5000, 'coupon5000.jpg', '0', '2019/07/11', '2019/09/11');

INSERT INTO coupon
(coupon_no, coupon_code, coupon_name, discount, image, coupon_status, make_date, limit_date)
VALUES
(seq_coupon_coupon_no.NEXTVAL, 'SS23F11XT', '한계돌파1만원권', 10000, 'coupon10000.jpg', '0', '2019/07/11', '2019/09/11');

INSERT INTO coupon
(coupon_no, coupon_code, coupon_name, discount, image, coupon_status, make_date, limit_date)
VALUES
(seq_coupon_coupon_no.NEXTVAL, 'P29FSF33CE', '한계돌파2만원권', 20000, 'coupon20000.jpg', '0', '2019/07/11', '2019/09/11');


INSERT INTO interest
(interest_no, board_code, comment_no, post_no, id, reg_date)
VALUES
(SEQ_INTEREST_INTEREST_NO.nextval, 'IS', 10001, 15556, 'user01', '2019-07-11');

INSERT INTO interest
(interest_no, board_code, comment_no, post_no, id, reg_date)
VALUES
(SEQ_INTEREST_INTEREST_NO.nextval, 'IS', null, 15557, 'user02', '2019-07-11');

INSERT INTO interest
(interest_no, board_code, comment_no, post_no, id, reg_date)
VALUES
(SEQ_INTEREST_INTEREST_NO.nextval, 'IS', 10002, 15555, 'user03', '2019-07-11');


INSERT INTO MILEAGE 
(MILEAGE_NO, MILEAGE_CODE, MILEAGE, ID, MILEAGE_REASON, REG_DATE) 
VALUES 
('10000', '1', '20000', 'user01', '상품 구매', TO_DATE('2019-07-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO MILEAGE 
(MILEAGE_NO, MILEAGE_CODE, MILEAGE, ID, MILEAGE_REASON, REG_DATE) 
VALUES 
('10002', '1', '500', 'user01', '이벤트 적립', TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO MILEAGE 
(MILEAGE_NO, MILEAGE_CODE, MILEAGE, ID, MILEAGE_REASON, REG_DATE) 
VALUES 
('10003', '1', '1000', 'user02', '상품 구매', TO_DATE('2018-03-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO MILEAGE 
(MILEAGE_NO, MILEAGE_CODE, MILEAGE, ID, MILEAGE_REASON, REG_DATE) 
VALUES 
('10001', '2', '-500', 'user01', '상품 구매', TO_DATE('2019-01-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO MILEAGE 
(MILEAGE_NO, MILEAGE_CODE, MILEAGE, ID, MILEAGE_REASON, REG_DATE) 
VALUES 
('10004', '2', '-100', 'user02', '상품 구매', TO_DATE('2019-01-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO MILEAGE 
(MILEAGE_NO, MILEAGE_CODE, MILEAGE, ID, MILEAGE_REASON, REG_DATE) 
VALUES 
('10005', '1', '5000', 'user02', '이벤트 적립', TO_DATE('2019-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO PRODUCT 
(PROD_NO, PROD_NAME, PRICE, MANU_DATE, REG_DATE, COUNTRY, QUANTITY, PROD_DETAIL, COMPANY, DISCOUNT_PRICE, PROD_CODE, MAIN_FILE) VALUES ('10001', '사료1', '20000', TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '프랑스', '1', '상세정보3', '현대', '19000', '10', 'A031426.jpg');

INSERT INTO PRODUCT 
(PROD_NO, PROD_NAME, PRICE, MANU_DATE, REG_DATE, COUNTRY, QUANTITY, PROD_DETAIL, COMPANY, DISCOUNT_PRICE, PROD_CODE, MAIN_FILE) VALUES ('10002', '사료11', '2000', TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '프랑스', '1', '상세정보4', '현대', '19000', '10', 'A031426.jpg');

INSERT INTO PRODUCT 
(PROD_NO, PROD_NAME, PRICE, MANU_DATE, REG_DATE, COUNTRY, QUANTITY, PROD_DETAIL, COMPANY, DISCOUNT_PRICE, PROD_CODE, MAIN_FILE) VALUES ('10003', '사료4', '20004', TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '이탈리아', '1', '상세정보6', '현대', '19000', '10', 'A031426.jpg');


INSERT INTO files
(file_no, board_code, post_no, file_name, file_code)
VALUES
(SEQ_FILES_FILE_NO.nextval, 'SH', 10001, 'A031426.jpg', 0);

INSERT INTO files
(file_no, board_code, post_no, file_name, file_code)
VALUES
(SEQ_FILES_FILE_NO.nextval, 'SH', 10002, 'A031426.jpg', 0);

INSERT INTO files
(file_no, board_code, post_no, file_name, file_code)
VALUES
(SEQ_FILES_FILE_NO.nextval, 'SH', 10003, 'A031426.jpg', 0);


INSERT INTO ORDERS 
(ORDER_NO, PROD_NO, ID, PHONE, RECEIVER_ADDR, RECEIVER_NAME, RECEIVER_PHONE, ORDER_REQUEST, PAYMENT_CODE, ORDER_DATE, ORDER_QUANTITY, TOTAL_PRICE, ORDER_CODE) 
VALUES 
('10000', '10001', 'user01', '011-1123-4567', '서울시 강남구', '강낭구', '010-2222-3333', '빨리요망', '2', TO_DATE('2019-02-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '30000', '1');

INSERT INTO ORDERS
(ORDER_NO, PROD_NO, ID, RECEIVER_ADDR, RECEIVER_NAME, RECEIVER_PHONE, ORDER_REQUEST, PAYMENT_CODE, ORDER_DATE, ORDER_QUANTITY, TOTAL_PRICE, ORDER_CODE) 
VALUES 
('10001', '10002', 'user02', '충북 제천시', '충재', '010-2223-8888', '기다립니다', '1', TO_DATE('2018-03-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '10000', '1');

INSERT INTO ORDERS 
(ORDER_NO, PROD_NO, ID, PHONE, RECEIVER_ADDR, RECEIVER_NAME, RECEIVER_PHONE, ORDER_REQUEST, PAYMENT_CODE, ORDER_DATE, ORDER_QUANTITY, TOTAL_PRICE, ORDER_CODE) 
VALUES 
('10002', '10003', 'user01', '011-1123-4567', '대전 광역시', '대광', '011-4555-2222', '배송전연락', '1', TO_DATE('2017-03-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '3', '40000', '1');


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
	LEVEL_POINT 		NUMBER(5,0), 
	ACCESS_DATE 		DATE, 
	ACCESS_IP 		VARCHAR2(100),
	ROLE			VARCHAR2(10)	DEFAULT 'user',  
	PURPOSE1		VARCHAR2(50), 
	PURPOSE2		VARCHAR2(50),
	PURPOSE3		VARCHAR2(50),
	PROFILE			VARCHAR2(100),
	PRIMARY KEY(USER_NO));
	
CREATE TABLE FILES (
	FILE_NO 			NUMBER(6,0) 	NOT NULL ENABLE, 
	BOARD_CODE 		CHAR(2) 		NOT NULL, 
	POST_NO 		NUMBER(6,0) 	NOT NULL, 
	FILE_NAME 		VARCHAR2(100) 	NOT NULL, 
	FILE_CODE 		CHAR(1) 		NOT NULL,
	PRIMARY KEY(FILE_NO));

   
CREATE TABLE ADOPT(
   BOARD_CODE       CHAR(2)       NOT NULL ENABLE, 
   POST_NO       NUMBER(6,0)    NOT NULL ENABLE, 
   ID          VARCHAR2(12)    NOT NULL ENABLE REFERENCES USERS(ID), 
   POST_TITLE       VARCHAR2(60) , 
   POST_CONTENT       VARCHAR2(600)    NOT NULL ENABLE, 
   PHONE          VARCHAR2(13)    NOT NULL ENABLE, 
   ADOPT_AREA       VARCHAR2(200) , 
   AREA_KR       VARCHAR2(200) , 
   LOCATION       VARCHAR2(100) , 
   LOCATION_KR       VARCHAR2(100)    NOT NULL ENABLE, 
   REG_DATE       DATE       NOT NULL ENABLE, 
   DOG_BREED       VARCHAR2(30), 
   DOG_WEIGHT       VARCHAR2(6) , 
   DOG_SIZE       VARCHAR2(10) , 
   DOG_GENDER       VARCHAR2(10)    NOT NULL ENABLE, 
   DOG_PAY       NUMBER(6,0)   NOT NULL ENABLE, 
   DOG_STATUS       VARCHAR2(60)    NOT NULL ENABLE, 
   DOG_CHAR       VARCHAR2(60)    NOT NULL ENABLE, 
   DOG_PERSONALITY    VARCHAR2(60) , 
   DOG_DATE       DATE       NOT NULL ENABLE, 
   MAIN_FILE           VARCHAR2(100)    NOT NULL,
   STATUS_CODE       CHAR(1)       NOT NULL ENABLE, 
   PRIMARY KEY (POST_NO));
	


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




INSERT INTO adopt (board_code, post_no, id, post_title, post_content, phone, adopt_area, area_kr, location, location_kr, reg_date, dog_breed, dog_weight, dog_size, dog_gender, dog_pay, dog_status, dog_char, dog_personality, dog_date, main_file, status_code) 
		VALUES ('AD', seq_adopt_post_no.nextval, 'user03', '�������Ծ��ϼ���1', '����', '011-2123-4567', '(38.073057724772966, 127.60071237487796)#','������ ��õ�� ��ϸ�  ', '(37.87554821220492, 127.72001389255138)', '������ ��õ�� �߾ӷ�', '2019-07-23', '����', '3', '������', '����', '1000','����', 'Ư¡', '����', '2019-07-23', '1.jpg', '1');


		
INSERT INTO apply (apply_no, adopt_no, id, phone, job, addr, mate, mate_agree, raise, plan, pay, reason, situation, reg_date) 
		VALUES	 (	seq_apply_apply_no.nextval, 10046, 'user04', '011-2123-4568', '�л�', '����Ʈ', '����', '����', '����', '��ȹ', '������', '����', '��Ȳ', SYSDATE  );

UPDATE adopt SET status_code = 3 where post_no = 10047;
UPDATE adopt SET status_code = 2 where post_no = 10046;
UPDATE adopt SET status_code = 2 where post_no = 10048;
UPDATE adopt SET status_code = 2 where post_no = 10049;
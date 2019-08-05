<<<<<<< HEAD
create or replace
FUNCTION GET_FILE_NO RETURN NUMBER AS
num NUMBER;
BEGIN
  SELECT SEQ_FILES_FILE_NO.NEXTVAL
  INTO num
  FROM dual;
  return num;
END GET_FILE_NO;

-- ���ν���
CREATE OR REPLACE PROCEDURE UPDATE_STATUS_CODE
IS

BEGIN

       UPDATE STORYFUNDING SET STATUS_CODE = '2' , FUND_START_DATE = SYSDATE , FUND_END_DATE = SYSDATE+ FUND_TARGET_DAY 
       WHERE VOTE_END_DATE< SYSDATE AND STATUS_CODE ='1'; 
       
       COMMIT;  
       
END UPDATE_STATUS_CODE;
/


-- ������ ���α׷� ���
BEGIN
DBMS_SCHEDULER.CREATE_PROGRAM(
program_name => 'UPDATE_STATUS_CODE_PROGRAM',
program_action => 'UPDATE_STATUS_CODE',
program_type => 'STORED_PROCEDURE',
comments => 'update status code program',
enabled => TRUE);
END;
 
--	������ ���
 BEGIN
DBMS_SCHEDULER.CREATE_SCHEDULE(
schedule_name => 'SCHEDULE_UPDATE_STATUS_CODE',
start_date       => TRUNC(SYSDATE+1),
end_date        => null,
repeat_interval => 'FREQ=DAILY;INTERVAL=1',
comments => 'Every PM 12 HOUR');
END;

-- JOB ���, ���� ���� �� �۾����� �����췯�� ���α׷��� ������ش�.
BEGIN
DBMS_SCHEDULER.CREATE_JOB (
job_name =>'UPDATE_STATUS_CODE_JOB',
program_name =>'UPDATE_STATUS_CODE_PROGRAM',
schedule_name =>'SCHEDULE_UPDATE_STATUS_CODE',
comments => 'update status code job program',
enabled =>TRUE);
END;

-- �Ŀ�����
CREATE OR REPLACE PROCEDURE UPDATE_STATUS_CODE_FUND
IS

BEGIN

       UPDATE STORYFUNDING SET STATUS_CODE = '4'
       WHERE FUND_END_DATE< SYSDATE AND STATUS_CODE ='3'; 
       
       COMMIT;  
       
END UPDATE_STATUS_CODE_FUND;
/


 BEGIN
DBMS_SCHEDULER.CREATE_PROGRAM(
program_name => 'UPDATE_STATUS_FUND_PROGRAM',
program_action => ' UPDATE_STATUS_CODE_FUND',
program_type => 'STORED_PROCEDURE',
comments => 'update fund status code program',
enabled => TRUE);
END;

BEGIN
DBMS_SCHEDULER.CREATE_SCHEDULE(
schedule_name => 'SCHEDULE_UPDATE_STATUS_FUND',
start_date       => TRUNC(SYSDATE+1),
end_date        => null,
repeat_interval => 'FREQ=DAILY;INTERVAL=1',
comments => 'Every PM 12 HOUR');
END;


BEGIN
DBMS_SCHEDULER.CREATE_JOB (
job_name =>'UPDATE_STATUS_FUND_JOB',
program_name =>'UPDATE_STATUS_FUND_PROGRAM',
schedule_name =>'SCHEDULE_UPDATE_STATUS_FUND',
comments => 'update status code fund job program',
enabled =>TRUE);
END;
=======
	create or replace
	FUNCTION GET_FILE_NO RETURN NUMBER AS
	num NUMBER;
	BEGIN
	  SELECT SEQ_FILES_FILE_NO.NEXTVAL
	  INTO num
	  FROM dual;
	  return num;
	END GET_FILE_NO;
	
	-- ���ν���
	CREATE OR REPLACE PROCEDURE UPDATE_STATUS_CODE
	IS
	
	BEGIN
	
	       UPDATE STORYFUNDING SET STATUS_CODE = '2' , FUND_START_DATE = SYSDATE , FUND_END_DATE = SYSDATE+ FUND_TARGET_DAY 
	       WHERE VOTE_END_DATE< SYSDATE AND STATUS_CODE ='1'; 
	       
	       COMMIT;  
	       
	END UPDATE_STATUS_CODE;
	/
	
	
	-- ������ ���α׷� ���
	BEGIN
	DBMS_SCHEDULER.CREATE_PROGRAM(
	program_name => 'UPDATE_STATUS_CODE_PROGRAM',
	program_action => 'UPDATE_STATUS_CODE',
	program_type => 'STORED_PROCEDURE',
	comments => 'update status code program',
	enabled => TRUE);
	END;
	 
	--	������ ���
	 BEGIN
	DBMS_SCHEDULER.CREATE_SCHEDULE(
	schedule_name => 'SCHEDULE_UPDATE_STATUS_CODE',
	start_date       => TRUNC(SYSDATE+1),
	end_date        => null,
	repeat_interval => 'FREQ=DAILY;INTERVAL=1',
	comments => 'Every PM 12 HOUR');
	END;
	
	-- JOB ���, ���� ���� �� �۾����� �����췯�� ���α׷��� ������ش�.
	BEGIN
	DBMS_SCHEDULER.CREATE_JOB (
	job_name =>'UPDATE_STATUS_CODE_JOB',
	program_name =>'UPDATE_STATUS_CODE_PROGRAM',
	schedule_name =>'SCHEDULE_UPDATE_STATUS_CODE',
	comments => 'update status code job program',
	enabled =>TRUE);
	END;
	
	-- �Ŀ�����
	CREATE OR REPLACE PROCEDURE UPDATE_STATUS_CODE_FUND
	IS
	
	BEGIN
	
	       UPDATE STORYFUNDING SET STATUS_CODE = '4'
	       WHERE FUND_END_DATE< SYSDATE AND STATUS_CODE ='3'; 
	       
	       COMMIT;  
	       
	END UPDATE_STATUS_CODE_FUND;
	/
	
	
	 BEGIN
	DBMS_SCHEDULER.CREATE_PROGRAM(
	program_name => 'UPDATE_STATUS_FUND_PROGRAM',
	program_action => ' UPDATE_STATUS_CODE_FUND',
	program_type => 'STORED_PROCEDURE',
	comments => 'update fund status code program',
	enabled => TRUE);
	END;
	
	BEGIN
	DBMS_SCHEDULER.CREATE_SCHEDULE(
	schedule_name => 'SCHEDULE_UPDATE_STATUS_FUND',
	start_date       => TRUNC(SYSDATE+1),
	end_date        => null,
	repeat_interval => 'FREQ=DAILY;INTERVAL=1',
	comments => 'Every PM 12 HOUR');
	END;
	
	
	BEGIN
	DBMS_SCHEDULER.CREATE_JOB (
	job_name =>'UPDATE_STATUS_FUND_JOB',
	program_name =>'UPDATE_STATUS_FUND_PROGRAM',
	schedule_name =>'SCHEDULE_UPDATE_STATUS_FUND',
	comments => 'update status code fund job program',
	enabled =>TRUE);
	END;
>>>>>>> refs/remotes/origin/master

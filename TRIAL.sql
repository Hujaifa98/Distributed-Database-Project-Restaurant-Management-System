DECLARE 

	STRING VARCHAR(50);
	Q1 VARCHAR(20);
	D1 NUMBER;
	Q2 VARCHAR(15);
	D2 NUMBER;
	Q3 VARCHAR(20);
	
BEGIN 
	
	STRING :='AMI,VAAT,KHAI';
	Q1 := SUBSTR(STRING,1, INSTR(STRING, ',' , 1, 1)-1);
	D1 := INSTR(STRING,',',1,1);
	
	Q2 := SUBSTR(STRING,D1+1, INSTR(STRING, ',' , 1, 1));
	D2 := INSTR(STRING,',',1,2);
	
	Q3 := SUBSTR(STRING,D2+1, INSTR(STRING, ',' , 1, 1));
	
	DBMS_OUTPUT.PUT_LINE(''||Q1||'');
	DBMS_OUTPUT.PUT_LINE(''||Q2||'');
	DBMS_OUTPUT.PUT_LINE(''||Q3||'');
	
	DBMS_OUTPUT.PUT_LINE(''||STRING||'');
	


END;
/
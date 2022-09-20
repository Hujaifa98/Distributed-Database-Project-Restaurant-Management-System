set serveroutput on;
set verify off;

accept x prompt	'FOR ORDER PRESS 1 AND TO MANAGE PRESS 2'

DECLARE
	
	A NUMBER := 0;
BEGIN
	A := &X;
	
	IF(A=1) THEN
		 @"G:\4.1\DDS lab\Project\Tables\main.sql"
		 
	end if;

END;
/
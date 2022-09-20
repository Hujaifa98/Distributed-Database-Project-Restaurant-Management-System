set serveroutput on;
set verify off;

DECLARE
	TOTAL_SELL NUMBER := 0;
	N1 NUMBER := 0;
	N NUMBER := 0;
	
BEGIN
	
	FOR Z IN (SELECT * FROM ORDERS) LOOP
			N1 := Z.PRICE;
			N := N + N1;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('TOTAL SELL :' ||N);
	
END;
/
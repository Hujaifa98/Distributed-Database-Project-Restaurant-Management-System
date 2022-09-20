set serveroutput on;
set verify off;

CREATE OR REPLACE TRIGGER ORDERED
AFTER INSERT ON
ORDERS
BEGIN
	DBMS_OUTPUT.PUT_LINE('ORDER IS BEING PROCESSED');
END;
/

CREATE OR REPLACE FUNCTION ORDERSS (MENU_IDS IN CUSTOMERS.CUSTOMER_ADDRESS%TYPE, QUANTITIES IN CUSTOMERS.CUSTOMER_ADDRESS%TYPE, CN IN CUSTOMERS.CUSTOMER_NAME%TYPE, CA IN CUSTOMERS.CUSTOMER_ADDRESS%TYPE)
RETURN NUMBER
IS

	M1 VARCHAR(10) := '0';
	M2 VARCHAR(10) := '0';
	M3 VARCHAR(10) := '0';
	M4 VARCHAR(10) := '0';
	M5 VARCHAR(10) := '0';
	
	D1 NUMBER;
	D2 NUMBER;
	D3 NUMBER;
	D4 NUMBER;
	D5 NUMBER;
	
	Q1 VARCHAR(10) := '0';
	Q2 VARCHAR(10) := '0';
	Q3 VARCHAR(10) := '0';
	Q4 VARCHAR(10) := '0';
	Q5 VARCHAR(10) := '0';
	
	D11 NUMBER;
	D22 NUMBER;
	D33 NUMBER;
	D44 NUMBER;
	D55 NUMBER;
	
	N1 NUMBER;
	ZZ NUMBER;
	PRICEE NUMBER := 0;
	INVALID_ORDER EXCEPTION;
	
BEGIN

	M1 := SUBSTR(MENU_IDS,1, INSTR(MENU_IDS, ',' , 1, 1)-1);
	D1 := INSTR(MENU_IDS,',',1,1);
	
	IF(LENGTH(M1)+1<LENGTH(MENU_IDS)) THEN
		M2 := SUBSTR(MENU_IDS,D1+1, INSTR(MENU_IDS, ',' , 1, 1)-1);
		D2 := INSTR(MENU_IDS,',',1,2);
	ELSE M2 := '0';
	END IF;
	
	IF(LENGTH(M1)+LENGTH(M2)+2<LENGTH(MENU_IDS)) THEN
		M3 := SUBSTR(MENU_IDS,D2+1, INSTR(MENU_IDS, ',' , 1, 1)-1);
		D3 := INSTR(MENU_IDS,',',1,3);
	ELSE M3 := '0';
	END IF;
	
	IF(LENGTH(M1)+LENGTH(M2)+LENGTH(M3)+3<LENGTH(MENU_IDS)) THEN
		M4 := SUBSTR(MENU_IDS,D3+1, INSTR(MENU_IDS, ',' , 1, 1)-1);
		D4 := INSTR(MENU_IDS,',',1,4);
	ELSE M4 := '0';
	END IF;
	
	IF(LENGTH(M1)+LENGTH(M2)+LENGTH(M3)+LENGTH(M4)+4<LENGTH(MENU_IDS)) THEN
		M5 := SUBSTR(MENU_IDS,D4+1, INSTR(MENU_IDS, ',' , 1, 1)-1);
		D5 := INSTR(MENU_IDS,',',1,5);
	ELSE M5 := '0';
	END IF;
	
	
	Q1:= SUBSTR(QUANTITIES,1, INSTR(QUANTITIES, ',' , 1, 1)-1);
	D11 := INSTR(QUANTITIES,',',1,1);
	
	
	IF(LENGTH(Q1)+1<LENGTH(QUANTITIES)) THEN
		Q2 := SUBSTR(QUANTITIES,D11+1, INSTR(QUANTITIES, ',' , 1, 1)-1);
		D22 := INSTR(QUANTITIES,',',1,2);
	ELSE Q2 := '0';
	END IF;
	
	IF(LENGTH(Q1)+LENGTH(Q2)+2<LENGTH(QUANTITIES)) THEN
		Q3 := SUBSTR(QUANTITIES,D22+1, INSTR(QUANTITIES, ',' , 1, 1)-1);
		D33 := INSTR(QUANTITIES,',',1,3);
	ELSE Q3 := '0';
	END IF;
	
	IF(LENGTH(Q1)+LENGTH(Q2)+LENGTH(Q3)+3<LENGTH(QUANTITIES)) THEN
		Q4 := SUBSTR(QUANTITIES,D33+1, INSTR(QUANTITIES, ',' , 1, 1)-1);
		D44 := INSTR(QUANTITIES,',',1,4);
	ELSE Q4 := '0';
	END IF;
	
	
	IF(LENGTH(Q1)+LENGTH(Q2)+LENGTH(Q3)+LENGTH(Q4)+4<LENGTH(QUANTITIES)) THEN
		Q5 := SUBSTR(QUANTITIES,D44+1, INSTR(QUANTITIES, ',' , 1, 1)-1);
		D55 := INSTR(QUANTITIES,',',1,5);
	ELSE Q5 := '0';
	END IF;
	
	
	FOR Z IN (SELECT COUNT(DISTINCT O_ID) AS COUNTT FROM ORDERS) LOOP
			N1 := Z.COUNTT;
			IF(N1>100000) THEN
				DELETE FROM ORDERS WHERE O_ID>=100000;
				N1 := 1;
			END IF;
	END LOOP;
	
	IF(M1!='0' AND M2!='0' AND M3!='0' AND M4!='0' AND M5!='0') THEN
		--SELECT PRICE FROM MENU WHERE M_ID = M1;
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M1,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M1)||'', Q1, Q1*(SELECT M_PRICE FROM MENU WHERE M_ID = M1) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M2,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M2)||'', Q2, Q2*(SELECT M_PRICE FROM MENU WHERE M_ID = M2) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M3,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M3)||'', Q3, Q3*(SELECT M_PRICE FROM MENU WHERE M_ID = M3) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M4,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M4)||'', Q4, Q4*(SELECT M_PRICE FROM MENU WHERE M_ID = M4) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M5,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M5)||'', Q5, Q5*(SELECT M_PRICE FROM MENU WHERE M_ID = M5) ,''||CN||'',''||CA||'',2); 

	ELSIF(M1!='0' AND M2!='0' AND M3!='0' AND M4!='0' AND M5='0') THEN
		--SELECT PRICE FROM MENU WHERE M_ID = M1;
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M1,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M1)||'', Q1, Q1*(SELECT M_PRICE FROM MENU WHERE M_ID = M1) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M2,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M2)||'', Q2, Q2*(SELECT M_PRICE FROM MENU WHERE M_ID = M2) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M3,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M3)||'', Q3, Q3*(SELECT M_PRICE FROM MENU WHERE M_ID = M3) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M4,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M4)||'', Q4, Q4*(SELECT M_PRICE FROM MENU WHERE M_ID = M4) ,''||CN||'',''||CA||'',2);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M5,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M5)||'', Q5, Q5*(SELECT M_PRICE FROM MENU WHERE M_ID = M5) ,''||CN||'',''||CA||'',1);
	
	ELSIF(M1!='0' AND M2!='0' AND M3!='0' AND M4='0' AND M5='0') THEN
		--SELECT PRICE FROM MENU WHERE M_ID = M1;
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M1,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M1)||'', Q1, Q1*(SELECT M_PRICE FROM MENU WHERE M_ID = M1) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M2,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M2)||'', Q2, Q2*(SELECT M_PRICE FROM MENU WHERE M_ID = M2) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M3,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M3)||'', Q3, Q3*(SELECT M_PRICE FROM MENU WHERE M_ID = M3) ,''||CN||'',''||CA||'',2);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M4,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M4)||'', Q4, Q4*(SELECT M_PRICE FROM MENU WHERE M_ID = M4) ,''||CN||'',''||CA||'',1);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M5,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M5)||'', Q5, Q5*(SELECT M_PRICE FROM MENU WHERE M_ID = M5) ,''||CN||'',''||CA||'',1);
	
	ELSIF(M1!='0' AND M2!='0' AND M3='0' AND M4='0' AND M5='0') THEN
		--SELECT PRICE FROM MENU WHERE M_ID = M1;
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M1,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M1)||'', Q1, Q1*(SELECT M_PRICE FROM MENU WHERE M_ID = M1) ,''||CN||'',''||CA||'',2);    
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M2,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M2)||'', Q2, Q2*(SELECT M_PRICE FROM MENU WHERE M_ID = M2) ,''||CN||'',''||CA||'',2);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M3,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M3)||'', Q3, Q3*(SELECT M_PRICE FROM MENU WHERE M_ID = M3) ,''||CN||'',''||CA||'',1);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M4,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M4)||'', Q4, Q4*(SELECT M_PRICE FROM MENU WHERE M_ID = M4) ,''||CN||'',''||CA||'',1);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M5,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M5)||'', Q5, Q5*(SELECT M_PRICE FROM MENU WHERE M_ID = M5) ,''||CN||'',''||CA||'',1);
	
	ELSIF(M1!='0' AND M2='0' AND M3='0' AND M4='0' AND M5='0') THEN
		--SELECT PRICE FROM MENU WHERE M_ID = M1;
		INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+100001, M1,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M1)||'', Q1, Q1*(SELECT M_PRICE FROM MENU WHERE M_ID = M1) ,''||CN||'',''||CA||'',2);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M2,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M2)||'', Q2, Q2*(SELECT M_PRICE FROM MENU WHERE M_ID = M2) ,''||CN||'',''||CA||'',1);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M3,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M3)||'', Q3, Q3*(SELECT M_PRICE FROM MENU WHERE M_ID = M3) ,''||CN||'',''||CA||'',1);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M4,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M4)||'', Q4, Q4*(SELECT M_PRICE FROM MENU WHERE M_ID = M4) ,''||CN||'',''||CA||'',1);    
		--INSERT INTO ORDERS (O_ID, m_ID,  O_ITEMS, QUANTITY, PRICE, CUSTOMER_NAME, CUSTOMER_ADDRESS, L_ID) VALUES (N1+1, M5,  ''||(SELECT M_NAME_SIZE FROM MENU WHERE M_ID = M5)||'', Q5, Q5*(SELECT M_PRICE FROM MENU WHERE M_ID = M5) ,''||CN||'',''||CA||'',1);
	
	ELSIF(M1='0') THEN
		RAISE INVALID_ORDER;
	
	
	
	
	END IF;
	
	FOR Z IN (SELECT * FROM ORDERS WHERE O_ID = N1+100001) LOOP
		
			ZZ := Z.PRICE;
			PRICEE := PRICEE + ZZ;
			
			
		
	END LOOP;
	
	IF(Q1!='0') THEN
		RETURN PRICEE;
	ELSE 
		RETURN 0;
		RAISE INVALID_ORDER;
	END IF;
	
	--RETURN 0;
	
	--DBMS_OUTPUT.PUT_LINE('TOTAL PRICE : '||PRICEE);
	
	
	

	
	
	









END ORDERSS;
/



DECLARE

	ORDERTAKINGG NUMBER := 0;
	A INT ;
	
	M_IDS VARCHAR(50);
	
	
	QTITIES VARCHAR(50);
	
	
	CN CUSTOMERS.CUSTOMER_NAME%TYPE;
	CA CUSTOMERS.CUSTOMER_ADDRESS%TYPE;
	
	INVALID_ORDER EXCEPTION;
	
	
	
BEGIN
	
	
	
	
	M_IDS := '&Menu_Item_Separated_by_Coma';
	QTITIES := '&Quantities_Separated_by_Coma';
	CN := '&Customer_Name';
	CA := '&Customer_Address';
	
	ORDERTAKINGG := ORDERSS(M_IDS, QTITIES, CN, CA);
	
	
	IF(ORDERTAKINGG = 0) THEN RAISE INVALID_ORDER;
	ELSE
		DBMS_OUTPUT.PUT_LINE('TOTAL PRICE : '||ORDERTAKINGG);

	END IF;
EXCEPTION

	WHEN INVALID_ORDER THEN
		DBMS_OUTPUT.PUT_LINE('YOU MAY BE MISSING A COMMA SOMEWHERE');
		DBMS_OUTPUT.PUT_LINE('PLEASE DO RECHECK');
	
	
	
	
	
	
	
	

END;
/

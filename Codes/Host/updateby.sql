SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT a PROMPT 'Enter book id:';
ACCEPT b PROMPT 'Enter price :';

DECLARE
	a number := &a;
	b number := &b;
	c number;
BEGIN
	c :=search(a,b);
	DBMS_OUTPUT.PUT_LINE('Done !');

	
END;
/
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER display_price1_changes 
AFTER DELETE OR INSERT OR UPDATE ON book
FOR EACH ROW 
DECLARE 
   quant_diff number; 
BEGIN 
 
   dbms_output.put_line('Old Price: ' || :OLD.bookprice); 
   dbms_output.put_line('New Price: ' || :NEW.bookprice); 
END; 
/ 
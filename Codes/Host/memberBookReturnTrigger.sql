SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER book_return
AFTER DELETE OR INSERT OR UPDATE ON member 
FOR EACH ROW 
DECLARE 
   quant_diff number; 
BEGIN 
   dbms_output.put_line('Old Status of Recieved Book: ' || :OLD.receivedBook); 
   dbms_output.put_line('New Status of Recieved Book:: ' || :NEW.receivedBook); 
END; 
/ 
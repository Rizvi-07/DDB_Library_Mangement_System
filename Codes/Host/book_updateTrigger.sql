SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER display_quantity_changes 
AFTER DELETE OR INSERT OR UPDATE ON book3
FOR EACH ROW 
DECLARE 
   quant_diff number; 
BEGIN 
 
   dbms_output.put_line('Old Qauntity: ' || :OLD.bookQuantity); 
   dbms_output.put_line('New Qauntity: ' || :NEW.bookQuantity); 
END; 
/ 
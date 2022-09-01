
clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
declare 

	p_id number := &previous_id;
	n_id number := &new_id;
	
begin

	update DONOR set DID = n_id where DID = p_id;
end;
/

create or replace trigger trigUpdateDonor
after update on DONOR

declare
	
begin

	dbms_output.put_line('Donor ID Updated!!');
	
end;
/

commit;
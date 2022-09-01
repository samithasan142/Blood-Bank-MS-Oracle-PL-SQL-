clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
declare 
	DID number := &Did;
	Dname varchar2(50) := '&Dname';
	Dage number := &Dage ; 
	Dgender varchar2(10) := '&Dgender';
	Dbloodgroup varchar2(10) := '&Dbloodgroup';
	Dcity varchar2(20) := '&Dcity';
	Dphonenum varchar2(15) := '&Dphonenum';
	Deligibility  varchar2(5) := '&Deligibility';
begin

	insert into DONOR values(DID,Dname,Dage,Dgender,Dbloodgroup,Dcity,Dphonenum,Deligibility);
	
end;

/

create or replace trigger trigInsertDonor
after insert on DONOR

declare
	
begin

	dbms_output.put_line('Data Inserted!');
	
end;
/

commit;
clear screen;

set serveroutput on;
set verify off;

declare
	inCity DONOR.dcity%TYPE := '&City';
	eligible donor.deligibility%type := 'Yes';
	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	city DONOR.Dcity%TYPE;
	phnum DONOR.Dphnum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	cursor donorbyeligibility(matchCity DONOR.Dcity%TYPE, elg donor.Deligibility%type) is
	select * from DONOR
	where Dcity = matchCity and Deligibility = elg;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'City' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbyeligibility(inCity, eligible);
	loop
		fetch donorbyeligibility into id,name,age,gender,bloodGrp,city,phnum,elgib;
		
		exit when donorbyeligibility%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||
		' -- '|| bloodGrp||' -- '||city||' -- '||phnum || ' -- ' || elgib);
		
	end loop;
	close donorbyeligibility;
	

end;
/

commit;
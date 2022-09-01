clear screen;

set serveroutput on;
set verify off;

declare
	bg DONOR.Dbloodgroup%TYPE := '&BloodGroup';	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	city DONOR.Dcity%TYPE;
	phnum DONOR.Dphnum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	cursor donorbygroup(matchGrp DONOR.Dbloodgroup%TYPE) is
	select * from DONOR
	where Dbloodgroup = matchGrp;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'City' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbygroup(bg);
	
	loop
		fetch donorbygroup into id,name,age,gender,bloodGrp,city,phnum,elgib;
		
		exit when donorbygroup%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||' -- '|| bloodGrp||' -- '||city||' -- '||phnum || ' -- ' || elgib);
		
	end loop;
	close donorbygroup;
	

end;
/

commit;

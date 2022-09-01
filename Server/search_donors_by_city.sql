clear screen;

set serveroutput on;
set verify off;

declare
	searchCity DONOR.dcity%TYPE := '&City';	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	city DONOR.Dcity%TYPE;
	phnum DONOR.Dphnum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	cursor donorbycity(matchCity DONOR.Dcity%TYPE) is
	select * from DONOR
	where Dcity = matchCity;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'City' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbycity(searchCity);
	loop
		fetch donorbycity into id,name,age,gender,bloodGrp,city,phnum,elgib;
		
		exit when donorbycity%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||' -- '|| bloodGrp||' -- '||city||' -- '||phnum || ' -- ' || elgib);
		
	end loop;
	close donorbycity;
	

end;
/

commit;
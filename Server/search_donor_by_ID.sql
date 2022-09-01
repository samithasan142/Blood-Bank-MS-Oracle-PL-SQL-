clear screen;

set serveroutput on;
set verify off;

declare
	searchID DONOR.dcity%TYPE := '&ID';	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	city DONOR.Dcity%TYPE;
	phnum DONOR.Dphnum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	amount donation_details.amount%Type;
	rname recipient.rname%type;
	rcity recipient.rcity%type;
	hospital donation_details.hospital%type;
	
	cursor donorbyID(matchID DONOR.Did%TYPE) is
	select did,dname,dbloodgroup,dcity,dphnum,deligibility,amount,rname,rcity,hospital from donor join (donation_details join recipient on donation_details.did = recipient.did)
	on donor.did = recipient.did
	where Did = matchid;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Donor Name'||' -- ' || ' -- '|| 'Blood Group'||' -- '|| 'Donor City' ||' -- '|| 
	' -- '|| 'Donor Phone Number' ||' -- '|| 'Donor Eligibility' ||' -- ' || 'Amount' ||' -- ' || 'Recipient Name' ||' -- ' || 'Recipient City' ||' -- ' || 'Hospital');
	
	open donorbyid(searchID);
	loop
		fetch donorbyid into id,name,bloodGrp,city,phnum,elgib,amount,rname,rcity,hospital;
		
		exit when donorbyid%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| bloodGrp||' -- '||city||' -- '||' -- '||phnum || ' -- ' || elgib 
		||' -- ' || amount ||' -- ' || rname ||' -- ' || rcity ||' -- ' || hospital);
		
	end loop;
	close donorbyid;
	

end;
/

commit;
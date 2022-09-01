create or replace PROCEDURE transfer(A1 in BLOOD_GROUP.bloodGroup%TYPE, A2 in BLOOD_GROUP.numberOfBag%TYPE )

is
  
  a BLOOD_GROUP.numberOfBag%TYPE;
  b BLOOD_GROUP.numberOfBag%TYPE;

begin
	
	select numberofbag into a from BLOOD_GROUP where bloodGroup = A1;
	select numberofbag into b from BLOOD_GROUP@nurul where bloodGroup = A1;
	a := a-A2;
	b := b+A2;
	
	update BLOOD_GROUP set numberofbag=a where bloodGroup=A1;
	update BLOOD_GROUP@nurul set numberofbag=b where bloodGroup=A1;

end transfer;
/

commit;
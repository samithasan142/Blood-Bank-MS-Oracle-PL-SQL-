
Select * from DONOR@nurul UNION Select * from DONOR;
Select * from RECIPIENT@nurul UNION Select * from RECIPIENT;
Select * from BLOOD_INVENTORY@nurul UNION Select * from BLOOD_INVENTORY;
Select * from DONATION_DETAILS@nurul UNION Select * from DONATION_DETAILS;
Select * from BLOOD_GROUP@nurul UNION Select * from BLOOD_GROUP;

commit;
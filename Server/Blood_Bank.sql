
clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;

DROP TABLE DONOR CASCADE CONSTRAINTS;
DROP TABLE RECIPIENT CASCADE CONSTRAINTS;
DROP TABLE BLOOD_INVENTORY CASCADE CONSTRAINTS;
DROP TABLE DONATION_DETAILS CASCADE CONSTRAINTS;
DROP TABLE BLOOD_GROUP CASCADE CONSTRAINTS;

SET LINESIZE 1000;

CREATE TABLE DONOR
(
	DID number not null primary key,
	Dname varchar2(20),
	Dage number, 
	Dgender varchar2(8),
	Dbloodgroup varchar2(3),
	Dcity varchar2(15),
	Dphnum varchar2(11),
	Deligibility  varchar2(5)
);
	
CREATE TABLE RECIPIENT (
	RID number, 
	Rname varchar2(20), 
	Rage number, 
	Rgender varchar2(8), 
	Rbloodgroup char(3), 
	Rcity varchar2(15), 
	Rphnum varchar2(11), 
	DID number,
    PRIMARY KEY(RID)
); 

CREATE TABLE BLOOD_INVENTORY
(
	DID number,
	bagnumber int, 
	heamoglobin number,
	platelets number,
    PRIMARY KEY(bagnumber)	
); 

CREATE TABLE DONATION_DETAILS
(
	DID number,
	donationnumber number, 
	hospital varchar2(50), 
	amount number,
	givenat date,
    PRIMARY KEY(donationnumber)	
); 

CREATE TABLE BLOOD_GROUP
(
	DID number,
	bloodGroup VARCHAR2(5), 
	numberOfBag number	
);


insert into DONOR values(1001,'Shakib',36,'Male','AB-','Basundhara','01710000000','Yes');
insert into DONOR values(1002,'Tisha',25,'Female','B-','Basundhara','01710000001','No');
insert into DONOR values(1003,'Jannat',30,'Female','A+','Dhanmondi','01710000002','Yes');
insert into DONOR values(1004,'Afif',24,'Male','AB+','Rampura','01710000003','Yes');
insert into DONOR values(1005,'Mahedi',40,'Male','B+','Khilgaon','01710000004','No');
insert into DONOR values(1006,'Safa',30,'Female','A+','Rampura','01710000005','No');
insert into DONOR values(1007,'Miraz',25,'Male','B-','Mirpur','01710000006','Yes');
insert into DONOR values(1008,'Mushfiq',35,'Male','A-','Tejgaon','01710000007','Yes');
insert into DONOR values(1009,'Sabbir',30,'Male','O+','Panthapath', '01710000008','No');
insert into DONOR values(1010,'Shohan',25,'Male','O-','Firmgate','01710000009','No');


insert into RECIPIENT values(2001, 'Abdullah', 25, 'Male', 'B+','Dhanmondi','01810000000', 1005); 
insert into RECIPIENT values(2002, 'Samiha', 20, 'Female', 'AB+','Basundhara','01810000001', 1004);
insert into RECIPIENT values(2003, 'Rifat', 35, 'Male', 'AB-','Banani','01810000002', 1001);
insert into RECIPIENT values(2004, 'Taskin', 40, 'Male', 'B-','Mirpur','01810000003', 1002);
insert into RECIPIENT values(2005, 'Sumaya', 30, 'Female', 'O+','Gulshan','01810000004', 1009);
insert into RECIPIENT values(2006, 'Oishy', 27, 'Female', 'A+','Rampura','01810000005', 1003);
insert into RECIPIENT values(2007, 'Anika', 32, 'Female', 'A+','Badda','01810000006', 1006);
insert into RECIPIENT values(2008, 'Riyad', 38, 'Male', 'A-','Uttara','01810000007', 1008);
insert into RECIPIENT values(2009, 'Ebadot', 25, 'Male', 'O-','Khilgaon','01810000008', 1010);
insert into RECIPIENT values(2010, 'Bijoy', 20, 'Male', 'B-','Shantinagar','01810000009', 1007);


insert into  BLOOD_INVENTORY values (1001,5001,  14, 55); 
insert into  BLOOD_INVENTORY values (1002, 5002,  15, 52);
insert into  BLOOD_INVENTORY values (1003, 5003,  16, 56);
insert into  BLOOD_INVENTORY values (1004, 5004,  18, 59);
insert into  BLOOD_INVENTORY values (1005, 5005,  14, 45);
insert into  BLOOD_INVENTORY values (1006, 5006,  17, 61);
insert into  BLOOD_INVENTORY values (1007, 5007,  15, 49);
insert into  BLOOD_INVENTORY values (1008, 5008,  10, 65);
insert into  BLOOD_INVENTORY values (1009, 5009,  12, 50);
insert into  BLOOD_INVENTORY values (1010, 5010,  14, 55);

insert into DONATION_DETAILS values (1001,7001, 'Dhaka Medical College', 2, TO_DATE('2018-02-03','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1002,7002, 'Shahid Suhrawardy Hospital', 3, TO_DATE('2015-11-22','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1003,7003, 'Al Din Hospital', 1, TO_DATE('2010-1-10','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1004,7004, 'Appolo Hospital', 2, TO_DATE('2014-2-14','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1005,7005, 'BSMMU', 4, TO_DATE('2015-4-16','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1006,7006, 'Pan pacific Hospital', 3, TO_DATE('2012-11-5','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1007,7007, 'Bangladesh Medical College', 1, TO_DATE('2018-1-21','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1008,7008, 'Central Hospital Ltd.', 1, TO_DATE('2016-9-13','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1009,7009, 'Islami Bank Hospital', 3, TO_DATE('2017-6-27','yyyy/mm/dd')); 
insert into DONATION_DETAILS values (1010,7010, 'City Hospital Ltd', 2, TO_DATE('2017-10-4','yyyy/mm/dd'));  
 

insert into  BLOOD_GROUP values (1001,'A+',5); 
insert into  BLOOD_GROUP values (1002,'A-',10);
insert into  BLOOD_GROUP values (1003,'B+',0); 
insert into  BLOOD_GROUP values (1004,'B-',25);
insert into  BLOOD_GROUP values (1005,'O+',20); 
insert into  BLOOD_GROUP values (1006,'O-',12);
insert into  BLOOD_GROUP values (1007,'AB+',18); 
insert into  BLOOD_GROUP values (1008,'AB-',22);

SELECT * FROM DONOR;
SELECT * FROM RECIPIENT;
SELECT * FROM BLOOD_INVENTORY;
SELECT * FROM DONATION_DETAILS;
SELECT * FROM BLOOD_GROUP;

commit;
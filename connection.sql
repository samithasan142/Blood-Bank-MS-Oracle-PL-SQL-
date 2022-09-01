
drop database link nurul;

create database link nurul
 connect to system identified by "123456"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.43.32)
		 (PORT = 1622))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  



/* =================================== 01 =======================================
   We have Install an SQL Server DB Engine
   We need SSMS Software

*/

/* =================================== 02 =======================================
   Object: Connecting to SQL Server using SSMS
   Object Explorer:
   Where you can see/explore the DB Objects
   Totype and execute queries we need a DB
   DB: Collection of tables and all your objects
   SSMS is a client tool to connect to SQL Server 
   (Database Server) SQL Server 

*/

/* =================================== 03 =======================================
   Object: Connecting to SQL Server using SSMS
   Object Explorer:
   Where you can see/explore the DB Objects
   Totype and execute queries we need a DB
   DB: Collection of tables and all your objects
   SSMS is a client tool to connect to SQL Server 
   (Database Server) SQL Server 
   DB is a type of SQL Server Objects
   Object: Database, Tables, Views etc
*/

Create Database Sample2
 

/* Renaming DB */
Alter Database Sample2 Modify Name = Sample3

/* Renaming DB by System Stored Procedure */
Execute sp_renamedb "Sample3" , "Sample4"


/* Drop / Delete DB. First change the name master to desired DB */
Drop Database Sample4

/* If want to Drop DB then set the DB from multi user mode to single user mode */
Alter Database Sample4 Set SINGLE_USER With Rollback Immediate

/* System DB cant be deleted */
Drop DataBase master



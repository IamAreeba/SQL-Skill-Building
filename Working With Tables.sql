


/* tblPerson acting as Foreign Key Table and tblGender acting as Primary Key Table
   tblPerson looks up Foreign Key value in tblGender table	   */

Use [Sample1]
Go

Create Table tblGender
(
ID int not null Primary Key,
Gender nvarchar(50) not null
)


/* Creating Foreign Key constraints using Query  */
Alter Table tblPerson add Constraint tblPerson_GendeerID_FK
Foreign Key (GenderID) references tblGender(ID)
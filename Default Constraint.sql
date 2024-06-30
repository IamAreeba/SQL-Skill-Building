
/*
DEFAULT CONSTRAINT:

	

*/

Select * from tblGender
Select * from tblPerson


Insert Into tblGender(ID, Gender) Values (3, 'UnKnown')

Insert Into tblPerson(Id, Name, Email, GenderID) Values (3, 'Simon', 's@s.com',1)
Insert Into tblPerson(Id, Name, Email, GenderID) Values (4, 'Sam', 'sam@sam.com',1)
Insert Into tblPerson(Id, Name, Email, GenderID) Values (5, 'May', 'may@may.com',2)
Insert Into tblPerson(Id, Name, Email, GenderID) Values (6, 'Kenny', 'k@k.com',3)


/*
If someone doesnt supply the value when inserting in the tblPerson table and since it is nullable so it be default
 insert NULL. But i want 3 UnKnown to be by default insert here so we have to use constraints 

*/
Insert Into tblPerson(Id, Name, Email) Values (7, 'Rich', 'r@r.com')


/* Adding Constraint by altering an existing column  */
Alter Table tblPerson
Add Constraint DF_tblPerson_GenderId
Default 3 for GenderID


Select * from tblPerson

Insert Into tblPerson(Id, Name, Email) Values (8, 'Mike', 'mike@mike.com')
Insert Into tblPerson(Id, Name, Email, GenderID) Values (9, 'Sara', 'sara#sare.com', 2)
Insert Into tblPerson(Id, Name, Email, GenderID) Values (10, 'Johnny', 'jhonny@jhonny.com', NULL)


/* Adding Constraint in column by altering an existing Table  */

/* Dropping Constraint */
Alter Table tblPerson
Drop Constraint DF_tblPerson_GenderId



/*   
Referential Integrity Constraint:

Orphan Records: If we are checking the Gender and it has some Id and we have to check it on another table 
and if that records is deleted then it will become an Orphan Record so SQL Server doesnt allow this kind of delete

 */

 Select * from tblGender
 Select * from tblPerson

 Delete From tblGender Where ID = 2
 Delete From tblGender Where Id = 3
 Delete From tblGender Where Id = 1

 Insert Into tblGender (ID, Gender) Values (1, 'Male')
 Insert Into tblGender (ID, Gender) Values (2, 'Female')
 Insert Into tblGender (ID, Gender) Values (3, 'UnKnown')


Delete From tblPerson 





/* Object: Unique KeyConstraint 
   A table has only 1 Primary Key and if i want the uniqueness of more column i cant do that using this key so we use 
   Unique Key Constraint. A table can have more than 1 unique key constraint and it allow only 1 null
   Interview Q: Digg btw Primary Key Constraint and Unique Key Constraint	
*/

Create Table tblPerson9
(
	ID int Primary Key NOT NULL,
	Name nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	GenderID int NULL,
	Age int NULL
)

Select * From tblPerson9

Alter Table UK_tblPerson9
Add Constraint UQ_tblPerson9_Email Unique(Email)

Insert Into tblPerson9 Values (1, 'Areeba', 'a@a.com', 2, 20)


-- Below throws error cuz voilation of Unique Key
Insert Into tblPerson9 Values (2, 'Aiman', 'a@a.com', 2, 20)

Alter Table tblPerson9
Drop Constraint UQ_tblPerson9_Email

Insert Into tblPerson9 Values (2, 'Aiman', 'b@b.com', 2, 20)

Select * From tblPerson9



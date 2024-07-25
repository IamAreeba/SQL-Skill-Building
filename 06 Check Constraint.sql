
/*
	CHECK constraint is used to limit the range of the values, that can be entered for a column.
	Age cant be -ve and person cant be alive after 150 years
	We can use Check constraint to limit this. So when u enter value it will check that
	Constraint is just a bool expression which returns T or F. The expression we write has to return T or F
	

*/


Create Table tblGender6(
	ID int NOT NULL Primary Key,
	Gender nvarchar(50) NOT NULL 	
)

Insert Into tblGender6 (ID, Gender) Values (1, 'Male')
Insert Into tblGender6 (ID, Gender) Values (2, 'Female')
Insert Into tblGender6 (ID, Gender) Values (3, 'Unknown')


Create Table tblPerson6(
	ID int NOT NULL Primary Key,
	Name nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	GenderID int NULL,
	Age int NULL 	
)

Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (1, 'John', 'j@j.com', NULL, NULL)
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (2, 'Ron', 'm@r.com', 1, NULL)
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (3, 'Rich', 'r@r.com', NULL, NULL)
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (4, 'Sara', 's@s.com', 2, -970)


/* Adding Foreign Key Constraint  */
Alter Table tblPerson6 Add Constraint tblPerson6_GenderID_FK 
Foreign Key (GenderID) references tblGender6(ID)

/*  Adiing Default Constraint */
Alter Table tblPerson6 
Add Constraint DF_tblPerson6_GenderID
Default 3 For GenderID

Select * from tblGender6
Select * from tblPerson6

/* To get the DataType of any column use sp_help   */
sp_help tblPerson6

SELECT *, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'tblPerson6';

/*  Adding the Constraint it wont be created cuz of that last row which has -ve value
	If the Creation or Re-Enabling option is set to "YES," the constraint will fail if existing data doesn't meet the criteria.
	You can delete or update the non-conforming data to apply the constraint. Turning off this option allows the new constraint 
	to apply only to incoming data, ignoring existing data that doesn't meet the criteria.
*/
Alter Table tblPerson6
Add Constraint CK_tblPerson6_Age Check (Age > 0  AND Age < 150)



/*  Delete that Invalid Row below which is in your table and then apply the constraint */
Delete From tblPerson6 Where ID = 4

/*  */
Alter Table tblPerson6
Add Constraint CK_tblPerson6_Age Check (Age > 0  AND Age < 150)

/*  Now it will through an error */
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (4, 'Sara', 's@s.com', 2, -970)
Select * from tblPerson6

/* Here when we write null constraint pass that. Cuz our bool expression doesnt return False it returns UnKnown
   cuz we cant compare NULL with anything. So we can add NULL and num lie btw 0 and 150 */
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (4, 'Sara', 's@s.com', 2, 10)
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (5, 'Sara', 's@s.com', 2, NULL)
Select * from tblPerson6

/*  Dropping the Constraint */
Alter Table tblPerson6
Drop Constraint CK_tblPerson6_Age


/*  Adding the Constraint */
Alter Table tblPerson6
Add Constraint CK_tblPerson6_Age Check (Age > 0  AND Age < 150)

/*  Now it will through error */
Insert Into tblPerson6 (ID, Name, Email, GenderID, Age) Values (4, 'Sara', 's@s.com', 2, 950)
Select * from tblPerson6

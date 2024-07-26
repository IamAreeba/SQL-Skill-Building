

/*
	Object: Identity Column
	PK is use to uniquely identify the record
	ID are somethings which users not need to provide e.g. When filling an application as a customer u dont need to provide CustomerID
	through that registeration form thats something automatically calculated by SQL Server so on those circumstaances we can use 
	Identity column so that we dont have to supply the value for that

	Make new Table and drag on that col properties you can see Identity Specification set to yes 2 more rows get enabled
	Identity Seed: Where should i start. 1 by default but we can customize that 
	Identity Increment: How much u want to inc when adding new record.

*/

Create Table tblPerson7
(
	PersonID int Identity (1,1) Primary Key,
	Name nvarchar(20)
)

Select * From tblPerson7

Insert Into dbo.tblPerson7 Values ('John')
Insert Into dbo.tblPerson7 Values ('Tom')
Insert Into dbo.tblPerson7 Values ('Sara')

/*  John left */
Delete From tblPerson7 Where PersonID = 1

/*  Since John left so 1 ID is empty and the next record doesnt reuse that ID so there is a gap that 1 ID is not present   */
Insert Into tblPerson7 Values ('Todd')

/* I want to reuse that old value now when inserting the next record. So below i am supplying the value explicitly. */
Insert Into tblPerson7 Values (1, 'Jane')

/*  Error: An explicit value for the identity column in table 'dbo.tblPerson7' can only be specified when a column list is used
	       and IDENTITY_INSERT is ON. */
Set IDENTITY_INSERT tblPerson7 ON
Insert Into tblPerson7 (PersonID, Name) Values (1, 'Jane')

/*  Since Identity Insert is ON so we have to explicitly supply the value */
Insert Into tblPerson7 Values ('Martin')


/*  So we have to off that. Now the sequence continues
	So 1 way to explicitly values for Identity column is to turn On the Identity Insert
 */
Set IDENTITY_INSERT tblPerson7 OFF
Insert Into tblPerson7 Values ('Martin')
Select * From tblPerson7


/*  There can be a scenario where we have deleted some records and gaps genereted. So to fill those gaps u can turn on
	Identity Insert and fill those gaps. 
	Deleted all rows so when u insert the record so dont assume that its going to reset the values of Identity Column he will
	inc it by 1 where he left he will not resetting the value 
*/
Delete From tblPerson7
Insert Into tblPerson7 values ('Martin')
Select * From tblPerson7


/*  If deleted all rows and want to reset the values we can use DBCC(DataBase Consistency Check Command) to reset the 
	identity values
*/
Delete From tblPerson7
DBCC CHECKIDENT(tblPerson7, RESEED, 0)
Insert Into tblPerson7 values ('Martin')
Select * From tblPerson7


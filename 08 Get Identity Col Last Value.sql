/* Object: Retriving last generated Identity Column Value */

Create Table Test8o1
(
ID int identity(1,1),
Value nvarchar(20)
)


Create Table Test8o2
(
ID int identity(1,1),
Value nvarchar(20)
)

Insert Into Test8o1 Values ('X')
Select * From Test8o1

/* Last Generated Identity Column  */
Select SCOPE_IDENTITY()
Insert Into Test8o1 Values ('X')
Select SCOPE_IDENTITY()
Select @@IDENTITY


/* The above is giving us same result so whats the difference. Creating Trigget on Test8o1 Table 
	We can create a trigger on a Table for a specific action.
	e.g When i insert a row in Test8o1 i want some processing to be done automatically. We can do that using Triggers.
		When i insert a row in Test8o1 i want another row to be automatically inserted into Test8o2 table by Triggers.
		So when ever any one insert row in table Test8o1 whatever below u have specified will be executed
*/

-- Stored procedure, function, trigger
Create Trigger trForInsert on Test8o1 for Insert
as Begin
	Insert Into Test8o2 Values ('YYYY')
End

Select * From Test8o1
Select * From Test8o2


Insert Into Test8o1 Values ('X')

Select SCOPE_IDENTITY()
Select @@IDENTITY
	


/* So whats the difference btw SCOPE_IDENTITY() and @@IDENTITY ?
	SCOPE_IDENTITY(): Return the last generated value in the same session ad the same scope 
					  After the INSERT INTO Test8o1 statement, if you call SCOPE_IDENTITY(), it will return the identity value 
					  created for the new record in Test8o1.
					  Why: Because SCOPE_IDENTITY() only cares about the current scope (the INSERT INTO Test8o1 statement), not 
							what happens in the trigger.
	@@IDENTITY: Return the last generated value in the same session across any scope
	Similarity: Both return the last generated value 
*/

Select SCOPE_IDENTITY()
Select @@IDENTITY

/* IDENT_CURRENT('TableName')  */

 -- User 1
Insert Into Test8o2 Values ('zzz')
Select SCOPE_IDENTITY() -- 02
Select @@IDENTITY -- 03
Select IDENT_CURRENT('Test8o2') -- 03

 -- User 2
Insert Into Test8o2 Values ('zzz')

-- In reality we use SCOPE_IDENTITY() to retrive the value 
-- e.g. A customer is registering with your product u need to give hi m ID. So when user insert the record we need to display that  
--		Identity value on the application

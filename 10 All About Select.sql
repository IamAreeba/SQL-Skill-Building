


/* Object: About Select
   Instead of * we can use column list. So we caan get it from: Table RC -> Script Table As -> Select To -> New Query Window
   Then SQL write the query for us. For better performance u can specify the name of the column list
	

*/

Create Table tblGender10
(
	ID int Primary Key NOT NULL,
	Gender nvarchar(50) NOT NULL
)

Insert Into tblGender10 (ID, Gender) Values (1, 'Male')
Insert Into tblGender10 (ID, Gender) Values (2, 'Female')
Insert Into tblGender10 (ID, Gender) Values (3, 'Unknown')

Create Table tblPerson10
(
	ID int Identity(1,1) Primary Key NOT NULL,
	Name nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	GenderID int NULL,
	Age int NULL,
	City nvarchar(50) NOT NULL
)


Insert Into tblPerson10 (Name, Email, GenderID, Age, City) Values ('Tom', 't@t.com', 1, 23, 'London')
Insert Into tblPerson10 (Name, Email, GenderID, Age, City) Values ('John', 'j@j.com', 1, 20, 'New York')
Insert Into tblPerson10 (Name, Email, GenderID, Age, City) Values ('Mary', 'm@m.com', 2, 21, 'Sydney')
Insert Into tblPerson10 (Name, Email, GenderID, Age, City) Values ('Josh', 'josh@josh.com', 1, 29, 'London')
Insert Into tblPerson10 (Name, Email, GenderID, Age, City) Values ('Sara', 's@s.com', 2, 25, 'Mumbai')


Select * from tblPerson10


Alter Table tblPerson10 Add Constraint FK_tblPerson10_GenderID
Foreign Key (GenderID) references tblGender10(ID)

Alter Table tblPerson10 Add Constraint DF_tblPerson10_GenderID
Default 3 For GenderID

Alter Table tblPerson10
Add Constraint CK_tblPerson10_Age Check (Age > 0  AND Age < 150)


Alter Table tblPerson10
Add Constraint UQ_tblPerson10_Email Unique(Email)



/* Distinct Rows
   City constin the duplicate. 2 peoples are living in London

*/

-- All the distinct cities that are available in the Table
Select Distinct City From tblPerson10

-- Distinct City and the name of the person. So here the Distinct KW is applied on 2 columns and they are always unique
Select Distinct  [Name], City From tblPerson10


/* Filtering with where clause
   People Living only in London.
   Where is basically use to limit the no of rows that we want to return
*/

Select * from tblPerson10 Where City = 'London'

-- People not residing in London instead of specifying multiple name of city use != or <>
Select * from tblPerson10 Where City <> 'London'
Select * from tblPerson10 Where City != 'London'

-- When we use where clause to filter the rows there are several operators we can use 
-- IN. Select all people whose Age are 20, 23, 25. So here we are specifying multiple filters/Conditions. So we can use IN 
-- Here we have many conditions concanated using the OR symbol
Select * From tblPerson10 Where Age = 20 or Age = 23 or Age = 29

-- To specify the list of values we can use IN operator
Select * From tblPerson10 Where Age IN( 20, 23, 29)

-- BETWEEN. Select All where Age are between 20and 25. And this boundary Condition 20 and 25 are inclusive means we have 20 and 25
-- Use Between to specify the range of values
Select * From tblPerson10 Where Age BETWEEN 20 AND 25


-- Like Operator is use to specify pattern 
-- Select people whose city name start with 'L'
Select * From tblPerson10 Where City Like 'L%'

-- Email Address which has got @ Symbol within that
Select * From tblPerson10 Where Email Like '%@%'	

-- Invalid Email Checking using NOT, LIKE operator 
Select * From tblPerson10 Where Email NOT LIKE '%@%'

-- With LIKE operators we use something like Wild Cards. So here % is a Wild Card. Here we are not specifying Char instead 
-- we are using % like a placeholder or substitue for some char it could be 0 or more char. 
-- So % is use as a replacement for 0 or more chracters 
-- '-' is use as a substitue for exactly 1 or more chracter
-- Email having 1 char before and after the @ symbol
Select * From tblPerson10 Where Email LIKE '_@_.com'
Select * From tblPerson10 Where Email NOT LIKE '_@_.com'


-- [] to specify the lsit of chars.
-- We want those people whose name starts with 'M,S,T'. BTW if we have char we need to specify in quotes not for no
 Select * From  tblPerson10  Where Email LIKE '[MST]%'

 Select * From  tblPerson10  Where Email NOT LIKE '[MST]%'

 -- ^. All people whose name doesnt start with MST
 Select * From  tblPerson10  Where Email LIKE '[^MST]%'

 
/* Joining Multiple Conditions using AND and OR operators   */
-- Select people living in London or Mumbai  and Age >= 

 Select * From  tblPerson10  Where (City = 'London' Or City = 'Mumbai') And Age > 25
 Select * From  tblPerson10  Where City IN ('London','Mumbai') And Age > 25

/* Sorting The Result Of a Query use Order By Clause
	When Selecting all the result only Primary Key is ordered or sorted 
*/
-- Select * People but names should be in Ascending Order and ASC is default
Select * From tblPerson10 Order By Name DESC

-- We can sort by multiple columns 
-- Sort first by name in Asc order then by Age in desc order. Here J are occuring 2 times so there Ages are sorted in Asc order 
Select * From tblPerson10 Order By Name DESC, Age Asc

/* 
	Selecting Top n or Top % of rows. So this Top is vey useful if Table is Large
*/

Select Top 2 * From tblPerson10 
Select Top 2 Name Age From tblPerson10 
Select Top 30 Percent * From tblPerson10  -- Top 30 % Of 5 is only 2



/*  Interview Question: How do you find the Top salary of an employee
 */

-- Find the Eldest Person 
Select * From tblPerson10 Order By Age DESC
Select Top 1 * From tblPerson10 Order By Age DESC



-- All column List
Select * from tblPerson10

-- Specific Column List
SELECT [ID]
      ,[Name]
      ,[Email]
      ,[GenderID]
      ,[Age]
      ,[City]
  FROM [dbo].[tblPerson10]
GO








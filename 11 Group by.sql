
/* Object: Group By */


Create Table tblEmployee11
(
	ID int Identity(1,1) Primary Key NOT NULL,
	Name nvarchar(50) NOT NULL,
	Gender nvarchar(50) NOT NULL,
	Salary int NOT NULL,
	City nvarchar(50) NOT NULL
)


Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Tom', 'Male', 4000, 'London')
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Pam', 'Female', 3000, 'New York' )
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'John', 'Male', 3500, 'London' )
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Sam', 'Male', 4500, 'London')
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Todd', 'Male', 2800, 'Sydney')
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Ben', 'Male', 7000, 'New York')
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Sara', 'Female', 4800, 'Sydney')
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ( 'Valarie', 'Female', 5500, 'New York')
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ('James', 'Male', 6500, 'London' )
Insert Into tblEmployee11 (Name, Gender, Salary, City) Values ('Russell', 'Male', 8800, 'London' )

Select * from tblEmployee11

-- Total/ Min/ Max Salary that i am paying within my organization
-- Use Aggregate Func: Sum(), Min(), Max()

Select SUM(Salary) From tblEmployee11
Select MIN(Salary) From tblEmployee11
Select MAX(Salary) From tblEmployee11

-- Total Salary that i am paying to Employees By City
-- We cant use the aggregate function on text

Select City, SUM(Salary) As TotalSalary
From tblEmployee11
Group By City

-- Error: Column 'tblEmployee11.City' is invalid in the select list because it is not contained in either an aggregate 
-- function or the GROUP BY clause.
-- We cant apply aggregate func on City cuz its Text and also its not the part of Group By clause so its invalid in the select list
-- So the columns we use in the select list they have to satisfy that either we are applying an aggregate func n that column
-- or that column should be part of Group By clause


Select City, SUM(Salary) As TotalSalary
From tblEmployee11


-- Now Breaking it down by Gender. Here we are grouping by multiple columns 
-- e.g In Sydeny how much is the total salary that i am paying for Male and Female employees

Select City, Gender, SUM(Salary) As TotalSalary
From tblEmployee11
Group By City, Gender
Order By City

Select Gender, City, SUM(Salary) As TotalSalary
From tblEmployee11
Group By Gender, City
Order By City


Select Count(*) From tblEmployee11
Select Count(ID) From tblEmployee11

-- Uisng 2	Aggregate func()
Select Gender, City, SUM(salary) as [Total Salary], Count(ID) as [Total Employees]
From tblEmployee11
Group By City, Gender
Order By City



/* Filtering Groups: 
	To Filter rows we ue where and having clause. Both return same result. But the way that they get executed are totally diff

	Interview Question: Differences Between Where and Having Clause ? 

	Where:
		From the Table only Males Record are retrived nad then they Grouped
		Here Aggregations are not done they are filtered even beofre the aggregations are done. Only male sets of records are
		retrived from table and then aggregated
		WHERE clause can be used with - Select, Insert, and Update statements


	Having:
		All the rows in the tblEmployee Table are retirved. They are grouped by Gender and the only Male Groups are shown
		filtering female groups.
		So here aggregation are done for every row in the table
		HAVING clause can only be used with the Select statement.


 */
-- I dont want to see Female Salaries only the Male salaries
Select Gender, City, SUM(salary) as [Total Salary], Count(ID) as [Total Employees]
From tblEmployee11
Where Gender = 'Male'
Group By City, Gender
Order By City


-- We can get the same result using Having Clause but it comes after the Group By Caluse 
Select Gender, City, SUM(salary) as [Total Salary], Count(ID) as [Total Employees]
From tblEmployee11
Group By City, Gender
Having Gender = 'Male'
Order By City


-- Aggregate functions cannot be used in the WHERE clause, unless it is in a sub query contained in a HAVING clause,
Select * From tblEmployee11 Where SUM(Salary) > 4000

-- Aggregate functions can be used in Having clause.
Select Gender, City, SUM(salary) as [Total Salary], Count(ID) as [Total Employees]
From tblEmployee11
Group By City, Gender
Having SUM(Salary)	> 5000
Order By City








/* Object: Joins In Sql Server */

Create table tblDepartment12
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into tblDepartment12 values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment12 values (2, 'Payroll', 'Delhi', 'Ron')
Insert into tblDepartment12 values (3, 'HR', 'New York', 'Christie')
Insert into tblDepartment12 values (4, 'Other Department', 'Sydney', 'Cindrella')
Go


Create table tblEmployee12
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment12(Id)
)
Go

Insert into tblEmployee12 values (1, 'Tom', 'Male', 4000, 1)
Insert into tblEmployee12 values (2, 'Pam', 'Female', 3000, 3)
Insert into tblEmployee12 values (3, 'John', 'Male', 3500, 1)
Insert into tblEmployee12 values (4, 'Sam', 'Male', 4500, 2)
Insert into tblEmployee12 values (5, 'Todd', 'Male', 2800, 2)
Insert into tblEmployee12 values (6, 'Ben', 'Male', 7000, 1)
Insert into tblEmployee12 values (7, 'Sara', 'Female', 4800, 3)
Insert into tblEmployee12 values (8, 'Valarie', 'Female', 5500, 1)
Insert into tblEmployee12 values (9, 'James', 'Male', 6500, NULL)
Insert into tblEmployee12 values (10, 'Russell', 'Male', 8800, NULL)
Go


Select * From tblEmployee12
Select * From tblDepartment12

-- INNER JOIN: Return only the matching rows btw both tables non matching rows eliminated
-- I want only matching rows between both tables

Select Name, Gender, Salary, DepartmentName
From tblEmployee12
INNER JOIN tblDepartment12							 -- OR JOIN
ON tblEmployee12.DepartmentId = tblDepartment12.ID


-- LEFT JOIN: Return matching rows + non matching rows from the Left table
-- I want all the Employees whether they are assigned to the department or not 

Select Name, Gender, Salary, DepartmentName
From tblEmployee12
LEFT JOIN tblDepartment12							-- LEFT OUTER JOIN
ON tblEmployee12.DepartmentId = tblDepartment12.ID


-- RIGHT JOIN: Return matching rows + non matching rows from the Right table
-- I want all the Employees whether they are assigned to the department or not 

Select Name, Gender, Salary, DepartmentName
From tblEmployee12
RIGHT JOIN tblDepartment12							-- RIGHT OUTER JOIN
ON tblEmployee12.DepartmentId = tblDepartment12.ID


-- FULL JOIN: Return matching rows + non matching rows from the Right table
-- I want all the Employees whether they are assigned to the department or not 

Select Name, Gender, Salary, DepartmentName
From tblEmployee12
FULL JOIN tblDepartment12							-- FULL OUTER JOIN
ON tblEmployee12.DepartmentId = tblDepartment12.ID


-- CROSS JOIN: Return cartesian product of tables that are involved. Doesnt have On clause
-- He takes each record from the right table and associate that with every record in left table .
-- Since it is doing cartesian product so it make sense of not using ON clause 

Select Name, Gender, Salary, DepartmentName
From tblEmployee12
CROSS JOIN tblDepartment12					



-- Generating The Generic Formula for Joins

SELECT     ColumnList
FROM       LeftTableName
JOIN_TYPE  RightTableName
ON         JoinCondition
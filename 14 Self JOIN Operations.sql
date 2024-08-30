

Create Table tblEmployee14
(
	EmployeeID int Primary Key NOT NULL,
	Name nvarchar(50) NOT NULL,
	ManagerID int NULL
)

Insert Into tblEmployee14 Values (1, 'Mike', 3)
Insert Into tblEmployee14 Values (2, 'Rob', 1)
Insert Into tblEmployee14 Values (3, 'Todd', NULL)
Insert Into tblEmployee14 Values (4, 'Ben', 1)
Insert Into tblEmployee14 Values (5, 'Sam', 1)

Select * From tblEmployee14

-- INNER SELF JOIN
-- Use ManagerID col and lookup in EmployeeID col in the same table
Select	   E.Name as Employee , M.Name as Manager 
From	   tblEmployee14 E
INNER JOIN  tblEmployee14 M
ON		   E.ManagerID = M.EmployeeID   -- In Employee Table take manager ID and lokup in Manager Table in Employee ID col


-- LEFT SELF JOIN
-- Use ManagerID col and lookup in EmployeeID col in the same table
Select	   E.Name as Employee , M.Name as Manager 
From	   tblEmployee14 E
LEFT JOIN  tblEmployee14 M
ON		   E.ManagerID = M.EmployeeID 


-- RIGHT SELF JOIN
-- Use ManagerID col and lookup in EmployeeID col in the same table
Select	   E.Name as Employee , M.Name as Manager 
From	   tblEmployee14 E
RIGHT JOIN  tblEmployee14 M
ON		   E.ManagerID = M.EmployeeID 


-- FULL SELF JOIN
-- Use ManagerID col and lookup in EmployeeID col in the same table
Select	   E.Name as Employee , M.Name as Manager 
From	   tblEmployee14 E
FULL JOIN  tblEmployee14 M
ON		   E.ManagerID = M.EmployeeID 


-- LEFT SELF JOIN
-- Use ManagerID col and lookup in EmployeeID col in the same table
Select	   E.Name as Employee , M.Name as Manager 
From	   tblEmployee14 E
CROSS JOIN  tblEmployee14 M



/* Object: Advanced Or Intelligent Joins In Sql Server 
   Previously we were gettting Matching rows + Non-matching part here we have to get only non-matching part
   Uing Previous Tables not making tables again

*/

Select * From tblEmployee12
Select * From tblDepartment12


-- LEFT JOIN
-- But here we want non-matching rows so we have to filter so for that we use where clause
Select	  Name, Gender, Salary, DepartmentName
From      tblEmployee12
LEFT JOIN tblDepartment12
ON		  tblEmployee12.DepartmentId = tblDepartment12.ID
Where     tblEmployee12.DepartmentId IS NULL


-- RIGHT JOIN
-- So here matching rows from the right table which are assigned on the left table will be filtered out and only the row 
-- from the RHS whcih is not assigned on the LHS will be filtered
Select	  Name, Gender, Salary, DepartmentName
From      tblEmployee12
RIGHT JOIN tblDepartment12
ON		  tblEmployee12.DepartmentId = tblDepartment12.ID
Where     tblEmployee12.DepartmentId IS NULL


-- FULL JOIN
-- We cant use = operator to compare null in SQL Server use IS KW
Select	  Name, Gender, Salary, DepartmentName
From      tblEmployee12
FULL JOIN tblDepartment12
ON		  tblEmployee12.DepartmentId = tblDepartment12.ID
Where     tblEmployee12.DepartmentId IS NULL  --
OR		  tblDepartment12.ID IS NULL
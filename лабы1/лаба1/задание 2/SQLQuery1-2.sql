SELECT DepartmentID,Name from HumanResources.Department 
 order by Name DESC
 offset 2 rows
 fetch next 5 rows only;
go
SELECT BusinessEntityID, JobTitle, Gender, BirthDate, HireDate from HumanResources.Employee
 where DATEDIFF(yy,BirthDate, HireDate) = 18;
go
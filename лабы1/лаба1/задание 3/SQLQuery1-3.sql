SELECT HumanResources.Employee.BusinessEntityID, JobTitle,  StartDate, EndDate 
from HumanResources.Employee full join HumanResources.EmployeeDepartmentHistory on 
HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID 
where JobTitle = 'Purchasing Manager';

go
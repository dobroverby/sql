--DepartmentID Name Max Rate
 
select HumanResources.Department.DepartmentID, HumanResources.Department.Name,max(Rate) as MaxRate from
HumanResources.Department
full join
HumanResources.EmployeeDepartmentHistory
on HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID
full join
HumanResources.EmployeePayHistory
on HumanResources.EmployeePayHistory.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
where EndDate is NULL
group by HumanResources.Department.DepartmentID, HumanResources.Department.Name
order by HumanResources.Department.DepartmentID;
go
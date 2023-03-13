
select tmp2.BusinessEntityID, tmp2.JobTitle,tmp2.RateCount from
(select tmp.BusinessEntityID,tmp.JobTitle, count(tmp.RateChangeDate) as RateCount
from
(SELECT  HumanResources.Employee.BusinessEntityID as BusinessEntityID, JobTitle, RateChangeDate 
from HumanResources.Employee full join HumanResources.EmployeePayHistory on 
HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID 
) as tmp
group by tmp.JobTitle,tmp.BusinessEntityID ) as tmp2
where tmp2.RateCount > 1
;
go
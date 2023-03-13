use master;
go


----a------
--a) создайте таблицу dbo.PersonPhone с такой же 
--структурой как Person.PersonPhone, не включая индексы, ограничения и триггеры
CREATE TABLE dbo.PersonPhone(
	BusinessEntityID INT,
	PhoneNumber nvarchar(25),
	PhoneNumberTypeID INT,
	ModifiedDate DATETIME
); 
go
-----b-----
---b) используя инструкцию ALTER TABLE, добавьте в таблицу dbo.PersonPhone новое поле ID, которое является уникальным ограничением
-- UNIQUE типа bigint и имеет свойство identity. Начальное значение для поля identity задайте 2 и приращение задайте 2;
ALTER TABLE dbo.PersonPhone
ADD ID bigint unique identity(2,2)
;
go
-----c----
--используя инструкцию ALTER TABLE, создайте для таблицы dbo.PersonPhone 
--ограничение для поля PhoneNumber, запрещающее заполнение этого поля буквами
ALTER TABLE dbo.PersonPhone
ADD CHECK (PhoneNumber NOT LIKE '%[A-Za-z]%')
;
go

----d-----
-- d) используя инструкцию ALTER TABLE, 
--создайте для таблицы dbo.PersonPhone ограничение DEFAULT для поля PhoneNumberTypeID, задайте значение по умолчанию 1;
ALTER TABLE dbo.PersonPhone
ADD DEFAULT 1 FOR PhoneNumberTypeID
;
go

----e----
--заполните новую таблицу данными из Person.PersonPhone, 
--где поле PhoneNumber не содержит символов ‘(‘ и ‘)’ и только для тех сотрудников,
--которые существуют в таблице HumanResources.Employee, 
--а их дата принятия на работу совпадает с датой начала работы в отделе;
----исправим таблицу по образу и подобию 
--drop table dbo.PersonPhone;



insert into dbo.PersonPhone (
	BusinessEntityID,
	PhoneNumber,
	PhoneNumberTypeID,
	ModifiedDate)

select 
	 AdventureWorks2012.Person.PersonPhone.BusinessEntityID as BusinessEntityID,
	 AdventureWorks2012.Person.PersonPhone.PhoneNumber as PhoneNumber,
	 AdventureWorks2012.Person.PersonPhone.PhoneNumberTypeID as PhoneNumberTypeID,
	 AdventureWorks2012.Person.PersonPhone.ModifiedDate as ModifiedDate
from 
    AdventureWorks2012.Person.PersonPhone join AdventureWorks2012.HumanResources.Employee on AdventureWorks2012.Person.PersonPhone.BusinessEntityID = AdventureWorks2012.HumanResources.Employee.BusinessEntityID
	join  AdventureWorks2012.HumanResources.EmployeeDepartmentHistory on AdventureWorks2012.Person.PersonPhone.BusinessEntityID = AdventureWorks2012.HumanResources.EmployeeDepartmentHistory.BusinessEntityID
where AdventureWorks2012.HumanResources.EmployeeDepartmentHistory.StartDate = AdventureWorks2012.HumanResources.Employee.HireDate
;
	

-- измените поле PhoneNumber, разрешив добавление null значений.

ALTER TABLE dbo.PersonPhone
alter column PhoneNumber nvarchar(25) Null;

-- check
insert into dbo.PersonPhone (
	BusinessEntityID,
	PhoneNumber,
	PhoneNumberTypeID,
	ModifiedDate) 
	values (777,null,1,2003-03-23);
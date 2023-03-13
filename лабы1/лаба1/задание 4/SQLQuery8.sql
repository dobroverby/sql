use master;
go


----a------
--a) �������� ������� dbo.PersonPhone � ����� �� 
--���������� ��� Person.PersonPhone, �� ������� �������, ����������� � ��������
CREATE TABLE dbo.PersonPhone(
	BusinessEntityID INT,
	PhoneNumber nvarchar(25),
	PhoneNumberTypeID INT,
	ModifiedDate DATETIME
); 
go
-----b-----
---b) ��������� ���������� ALTER TABLE, �������� � ������� dbo.PersonPhone ����� ���� ID, ������� �������� ���������� ������������
-- UNIQUE ���� bigint � ����� �������� identity. ��������� �������� ��� ���� identity ������� 2 � ���������� ������� 2;
ALTER TABLE dbo.PersonPhone
ADD ID bigint unique identity(2,2)
;
go
-----c----
--��������� ���������� ALTER TABLE, �������� ��� ������� dbo.PersonPhone 
--����������� ��� ���� PhoneNumber, ����������� ���������� ����� ���� �������
ALTER TABLE dbo.PersonPhone
ADD CHECK (PhoneNumber NOT LIKE '%[A-Za-z]%')
;
go

----d-----
-- d) ��������� ���������� ALTER TABLE, 
--�������� ��� ������� dbo.PersonPhone ����������� DEFAULT ��� ���� PhoneNumberTypeID, ������� �������� �� ��������� 1;
ALTER TABLE dbo.PersonPhone
ADD DEFAULT 1 FOR PhoneNumberTypeID
;
go

----e----
--��������� ����� ������� ������� �� Person.PersonPhone, 
--��� ���� PhoneNumber �� �������� �������� �(� � �)� � ������ ��� ��� �����������,
--������� ���������� � ������� HumanResources.Employee, 
--� �� ���� �������� �� ������ ��������� � ����� ������ ������ � ������;
----�������� ������� �� ������ � ������� 
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
	

-- �������� ���� PhoneNumber, �������� ���������� null ��������.

ALTER TABLE dbo.PersonPhone
alter column PhoneNumber nvarchar(25) Null;

-- check
insert into dbo.PersonPhone (
	BusinessEntityID,
	PhoneNumber,
	PhoneNumberTypeID,
	ModifiedDate) 
	values (777,null,1,2003-03-23);
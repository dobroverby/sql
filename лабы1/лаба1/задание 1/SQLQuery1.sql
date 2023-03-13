USE master;
GO

CREATE DATABASE NewDatabase;
GO

CREATE SCHEMA sales;
GO

CREATE SCHEMA persons;
GO

CREATE TABLE sales.Orders (OrderNum INT NULL);
GO

BACKUP DATABASE NewDatabase TO DISK = 'E:\учёба\лабы1\MyDB_Full.bak'
GO

DROP DATABASE NewDatabase;
GO

RESTORE DATABASE NewDatabase FROM DISK = 'E:\учёба\лабы1\MyDB_Full.bak';
GO


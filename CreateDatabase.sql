USE [master]
GO

CREATE DATABASE Lesson3Database ON PRIMARY
(
	NAME = N'Lesson3Database',
	FILENAME = N'C:\Lesson3\Lesson3Database.mdf',
	SIZE = 3MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
)
LOG ON
(
	NAME = N'Lesson3DatabaseLog',
	FILENAME = N'C:\Lesson3\Lesson3DatabaseLog.ldf',
	SIZE = 2MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
)
GO
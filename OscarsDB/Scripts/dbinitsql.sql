USE master;
GO

IF NOT EXISTS (
      SELECT name
      FROM sys.databases
      WHERE name = N'OscarParty'
      )
   CREATE DATABASE [OscarParty];
GO

IF SERVERPROPERTY('ProductVersion') > '12'
   ALTER DATABASE [OscarParty] SET QUERY_STORE = ON;
GO
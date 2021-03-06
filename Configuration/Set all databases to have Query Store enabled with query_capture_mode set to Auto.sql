-- Set all databases to have Query Store enabled with query_capture_mode set to Auto
-- Part of the SQL Server DBA Toolbox at https://github.com/DavidSchanzer/Sql-Server-DBA-Toolbox
-- This script turns on Query Store on all user databases with recommended standard settings

USE [master];
GO
EXEC dbo.sp_ineachdb @command = 'ALTER DATABASE ? SET QUERY_STORE = ON; ALTER DATABASE ? SET QUERY_STORE (OPERATION_MODE = READ_WRITE, QUERY_CAPTURE_MODE = AUTO, CLEANUP_POLICY = ( STALE_QUERY_THRESHOLD_DAYS = 60 ))',
                     @user_only = 1;
GO

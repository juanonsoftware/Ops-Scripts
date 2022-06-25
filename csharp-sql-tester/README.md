# C# SQL Tester
Using C# console application to execute a SQL command

Case 1: execute a sproc

<add key="CommandMode" value="ExecuteReader"/>
<add key="SqlCommandText" value="exec [dbo].[GetData] 'Y';"/>

Case 2: execute an update script

<add key="CommandMode" value="ExecuteNonQuery"/>
<add key="SqlCommandText" value="UPDATE [dbo].[Item] SET [Name] = 'Item One' WHERE [Name] = 'Item 1'"/>


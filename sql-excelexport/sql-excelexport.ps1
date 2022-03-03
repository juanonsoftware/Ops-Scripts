# Export dataset from SQL script to excel file
# Created date: 03/03/2022

$sqlScript = ".\test-script.sql"
$sqlConnectionString = "Server=(local)\SQLEXPRESS;Uid=testuser;Pwd=Abc@123456;Database=TESTDB"

$outputFile = ".\Output_" + (Get-Date).ToString("yyyyMMdd_hhmmss") + ".xlsx"
$worksheetName = "Items"

# Execute the SQL script
$data = Invoke-Sqlcmd -ConnectionString $sqlConnectionString -InputFile $sqlScript -OutputAs DataTables

# Now export data
$data | Export-Excel -Path $outputFile -WorksheetName $worksheetName -FreezeTopRow -BoldTopRow -NoNumberConversion * -ExcludeProperty RowError,RowState,Table,HasErrors,ItemArray

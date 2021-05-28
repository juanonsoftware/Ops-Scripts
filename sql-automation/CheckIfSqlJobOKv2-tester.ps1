$sqlServer = "YOURSERVER\INSTANCE"
$jobName = "YOUR_SQL_JOB"
$recentHours = 25

.\CheckIfSqlJobOKv2.ps1 -sqlServer $sqlServer -jobName $jobName -recentHours $recentHours

if($LastExitCode -eq 0) 
{
	"OK"
}
else
{
	"KO"
}

# Created	: 2/1/2020
# Source	: https://github.com/juanonsoftware/Ops-Scripts/tree/master/sftp-automation-testing
# Purpose	: Check if a SQL job completed and returns 0 if success, otherwise returns -1

param(
	[string]$sqlServer,
	[string]$jobName,
	[int]$recentHours,
	[int]$retryTimes = 5,
	[int]$sleepSeconds = 300
)

$script = "
	select top 1 j.name as job_name, jh.* 
	from msdb.dbo.sysjobhistory jh
		inner join msdb.dbo.sysjobs j on j.job_id = jh.job_id
	where j.name='$jobName'
		and jh.step_id=0
	order by jh.run_date desc, run_time desc
"

# Continue waiting if the job is not completed yet
$wait = $TRUE
$jobSuccess = $FALSE

do
{
	$results = Invoke-Sqlcmd -Query $script -ServerInstance $sqlServer
	$sleep = $FALSE

	if($results -eq $NULL) {
		"No info about the job / job history"
		$sleep = $TRUE
	}
	# Check if the job was running within $recentHours
	elseif((Get-Date) -gt [datetime]::ParseExact($results["run_date"], 'yyyyMMdd', $NULL).AddHours($recentHours)) {
		"KO: run_status = 1 but it's too old"
		$sleep = $TRUE
	}
	elseif(($results["run_status"] -ne 1)) {
		"KO: run_status != 1"
		$wait = $FALSE
		$jobSuccess = $FALSE
	}
	else {
		"OK: run_status = 1 and is within recent hours"
		$wait = $FALSE
		$jobSuccess = $TRUE
	}
	
	if($sleep -and ($retryTimes -ge 1)) {
		"Sleeping a moment before checking again"
		Start-Sleep -Seconds $sleepSeconds
		$retryTimes = $retryTimes - 1
	}
}
while($wait -and ($retryTimes -gt 0))

if($jobSuccess) {
	Exit 0
}
else {
	Exit -1
}

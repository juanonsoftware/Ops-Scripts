# Created	: 3/1/2021
# Source	: https://github.com/juanonsoftware/Ops-Scripts/tree/master/ftp-automation-testing
# Purpose	: Automatic upload files via FTP

$logFileSFTP = ".\Logs\FTP_" + (get-date).tostring("yyyyMMdd_hhmmss") + ".log"
$ftpCommandFile = ".\test-commands.ftp"

$cmdPath = "ftp"	# This is a Windows command

$cmdArgList = @(
	"-n"
	,"-s:$ftpCommandFile"
)

# run the command
& $cmdPath $cmdArgList > $logFileSFTP

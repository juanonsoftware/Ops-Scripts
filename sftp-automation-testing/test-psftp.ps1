# Created	: 20/05/2021
# Source	: https://github.com/juanonsoftware/Ops-Scripts/tree/master/sftp-automation-testing
# Purpose	: Automatic upload files via SFTP

$server = "YOUR SERVER IP"
$userName = "sftpu1"
$password = "Abc123456"
$batchFile = ".\test-psftp.sftp"

$cmdPath = "D:\Tools\FTP\psftp.exe"
$cmdArgList = @(
	"$userName@$server"
	,"-P", 22
	,"-pw", $password
	,"-b", $batchFile
)

# run the command
& $cmdPath $cmdArgList

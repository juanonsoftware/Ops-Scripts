$server = "137.116.119.169"
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
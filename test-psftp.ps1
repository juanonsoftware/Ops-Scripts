$server = "localhost"
$userName = "sftp1"
$password = "Abc123456"
$batchFile = ".\test-psftp.sftp"

$cmdPath = "D:\Tools\FTP\psftp.exe"
$cmdArgList = @(
	"$userName@$server"
	,"-P", 33
	,"-pw", $password
	,"-b", $batchFile
)

# run the command
& $cmdPath $cmdArgList
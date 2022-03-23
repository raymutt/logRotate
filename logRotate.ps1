Param(
[Parameter(Mandatory=$true)]  
[string]$logFolder,
[Parameter(Mandatory=$true)]  
[string]$filterPattern,  
[Parameter(Mandatory=$true)]  
[int]$fileAge, 
[Parameter(Mandatory=$true)]  
[int]$archiveAge  
)

$logFiles = Get-ChildItem $logFolder -Filter $filterPattern | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-1 * $fileAge)}
$dateString = Get-Date -format "yyyy-MM-dd-HH:mm"
$destinationPath = $logFolder + '\' + $dateString + ".zip"

## archive $logFiles in $logFolder older than $fileAge (in days)
function Push-ArchiveFiles {
    $logFilePaths = @()  
    if ($logFiles.count -eq 0){
        return 'No files to archive. No files old enough, or pattern not found: ' + $filterPattern + '. Moving on...'
    } else {
    foreach($logFile in $logFiles){ 
        $logFilePaths += ($logFile.FullName)
        Compress-Archive -Path $logFilePaths -DestinationPath $destinationPath -CompressionLevel Optimal  
        Remove-Item -path $logFilePaths  
        }
    }
}

Push-ArchiveFiles

$archiveFiles = Get-ChildItem $logFolder -Filter *.zip | Where-Object {$_.LastWriteTime -lt  (Get-Date).AddDays(-1 * $archiveAge)}  

## delete archives in $logFolder older than $archiveAge (in days)
function Remove-ArchiveFiles {
    if ($archiveFiles.count -eq 0){
        return 'No archives to remove, all done!'
    } else {
    foreach($archiveFile in $archiveFiles){
        Remove-Item -path $archiveFile.FullName
        }
    }
}

Remove-ArchiveFiles
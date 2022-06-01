# logRotate
Powershell script for rotating log files. As written, can be run a maximum of only once daily. If you want to rotate logs more frequently, you'll need to adjust the granularity of `$dateString`.

## How to Use:

Note: If you do not provide input paramaters, you will be prompted to do so. They are:

- `-logFolder`: path to log folder
- `-filterPattern`: string for filtering. 
  - Must use a wildcard character, `*` to obtain all instances (ex. `*.log` or `Log_*`)
- `-fileAge`: in days
- `-archiveAge`: in days

1. Run directly from Powershell terminal:

`logRotate.ps1 -logFolder <Path> -filterPattern <string> -fileAge <num> -archiveAge <num>`

2. Use Task Scheduler to run at intervals:

`powershell.exe -file <Path>\<to>\<script> -logFolder <Path> -filterPattern <pattern> -fileAge <num> -archiveAge <num>`

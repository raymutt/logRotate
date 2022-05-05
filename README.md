# logRotate
Powershell script for rotating log files. As written, can be run only once daily.

## How to Use:

Note: If you do not provide input paramaters, you will be prompted to do so. They are:

```
-logFolder ## path to log folder
-filterPattern ## string for filtering. Must use a wildcard character, '*' to obtain all instances
-fileAge ## in days
-archiveAge ## in days
```

1. Run directly from Powershell terminal:

`logRotate.ps1 -logFolder <Path> -filterPattern <string> -fileAge <num> -archiveAge <num>`

2. Use Task Scheduler to run at intervals:

`powershell.exe -file <Path>\<to>\<script> -logFolder <Path> -filterPattern <pattern> -fileAge <num> -archiveAge <num>`

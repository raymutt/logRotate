# logRotate
Powershell script for rotating log files

## How to Use:

Note: If you do not provide input paramaters, you will be prompted to do so.

1. Run directly from Powershell terminal:

```
logRotate.ps1 -logFolder <Path>\<to>\<log>\<Folder> -filterPattern <string for filtering files> -fileAge <number in days> -archiveAge <number in days>
```

2. Use Task Scheduler to run at intervals

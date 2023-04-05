# MHRiseUtils
PowerShell utilities for Monster Hunter Rise.

Scripts need to be run as administrator with either PowerShell or Comand Prompt because I did not sign them.



Script:
Backup-MHRiseSave.ps1

Description:
Used to backup Monster Hunter Rise Save Data to a selected folder. Will Overwrite previous backup if saved to the same destination folder. 

Example:
```
powershell.exe -ExecutionPolicy Bypass -File C:\Temp\Backup-MHRiseSave.ps1
```


Script:
Clean-Drives.ps1

Description:
Removes all PnP Devices thats names are named 'Xvd' or 'Volume'

Example:
```
powershell.exe -ExecutionPolicy Bypass -File C:\Temp\Clean-Drives.ps1
```


Script:
Clean-XvdDrives.ps1

Description:
Removes all PnP Devices that are named 'Xvd'

Example:
```
powershell.exe -ExecutionPolicy Bypass -File C:\Temp\Clean-XvdDrives.ps1
```

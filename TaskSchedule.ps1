$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-File C:\Scripts\RegSync.ps1'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)


Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "PRTG_Reg_Sync" -Description "Runs REGSync.ps1 every 10 minutes" -User SYSTEM

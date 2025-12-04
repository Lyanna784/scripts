***Remote App Management 

The purpose of this script is to streamline the remote management process by automating uninstalls through Task Scheduler. The task is scheduled to run a PowerShell script file that contains the script to uninstall programs remotely through invoke-command. 

**Requirements:
1. Administrator privileges
2. PowerShell
3. winrm enabled 
4. Wi-Fi  
5. Windows 10/11

**Make sure script file is on computer locally either by using an external flash drive or copying over through PowerShell
 1. External flash drive 
-Copy the script files `remoteUninstall-programs.ps1` from/to a computer with admin privileges into a local file

2. PowerShell copy/paste file  

Open a PowerShell console with admin privileges, then run: 

Pssession method: 
`$session = new-pssession -computername 'hostname or IPv4'`
`cd "FOLDER PATH"`  #make sure you're in the right directory 
`Copy-Item -Path ".\path to your local script" -Destination "local path destination" -ToSession $session -Force`
`Get-pssession | remove-pssession` #close pssessions 

OR

Invoke-command method:
$cred = (get-credential)
Invoke-Command -ComputerName 'hostname or IPv4' -credential $cred -ScriptBlock {Copy-Item -Path ".\path to your local script" -Destination "local path destination" -ToSession $session -Force`
}

*Task Scheduler Instructions
1. Search "Task Scheduler" through the windows search bar
-Right click on "Task Scheduler" and select "run as administrator"

2. Create Task
-Go into the "Actions" pane on the right side of the window and choose option "Create Task"

3. General 
- Name Task 
- Select box "Run with highest privileges"

4. Actions 
-Select "New..." on the left bottom corner 
-Action: start a program 
-Settings: 
Program/script: "powershell.exe"
-Add Arguments: "-executionpolicy bypass -file "remoteUninstall-programs.ps1""

5. Triggers
-Select "New..." on the left bottom corner
-Choose time and data for when the script file runs 



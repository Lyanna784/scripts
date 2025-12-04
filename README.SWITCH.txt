***Remote App Management 

The purpose of this script is to streamline the computer management process by automating app management, updates, and more by using an interactive menu. You can simply add/edit the main programs arrays to change the computers you would like to remote into or edit the different programs by searching their winget ID/name.

**Requirements:
1. Administrator privileges
2. PowerShell
3. Wi-Fi  
4. Windows 10/11


**Make sure script file is on computer locally either by using an external flash drive or copying over through PowerShell
 1. External flash drive 
-Copy the script from an external flash drive onto the new computer
-Run the script file `newComputer-setup.ps1` on the computer by opening the script, then copy and pasting the text into a PowerShell console with administrator privileges

2. Invoke-command method:
$cred = (get-credential)
Invoke-Command -ComputerName 'hostname or IPv4' -credential $cred -ScriptBlock {Copy-Item -Path ".\path to your local script" -Destination "local path destination" -ToSession $session -Force`
}

**How to Run Script 
1. Open a PowerShell console with administrator privileges 

2. Run the Script File

-Copy and paste the script file text into the PowerShell console 

or 

Run in the console: 
powershell -ExecutionPolicy Bypass -Command "& { . 'C:\path\to\script\newComputer-setup.ps1' }"


**Features:
1. Install Programs
-install programs using winget app installer, edit $installPrograms array to change list of apps

2. Uninstall Programs
-uninstall programs using winget app installer, edit $uninstallPrograms array to change list of apps

3. Re-name PC
-change the host/pc name using "rename-computer", then you are provided with the option to restart computer 

4. Create a Local IT Folder
-an empty folder is created on the computer locally named "IT"

5. Upgrade Apps
-upgrades all apps downloaded from the winget msstore 

6. Update Windows System
-updates windows system using the command prompt to search for updates, download updates then install the updates after
-you are provided with the option to restart your computer to finish the system updates


**Switch Menu:
Select 1 to Install Programs
Select 2 to Uninstall Programs
Select 3 to Re-name PC
Select 4 to Create a Local IT Folder
Select 5 to Upgrade Apps
Select 6 to Update Windows System
Select q to Quit
Please make a selection: 


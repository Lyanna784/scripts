#switch menu that installs or uninstalls programs 


#runs script as administrator when right clicking on file to run with powershell 
<#
$filePath = 'C:\IT\Scripts\manage-programs.ps1'

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Restarting script as Administrator..." -ForegroundColor Yellow
    Start-Process powershell.exe -ArgumentList "-NoExit", "-NoProfile", "-ExecutionPolicy Bypass", "-File", "`"$filePath`"" -Verb RunAs
    exit
}


Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force#>


function installs{

#parameters to call functions in the main switch 
param(
        [string[]]$Programs,
        [string[]]$Computers)

foreach($computer in $computers){

#open pssession for each computer listed in array by hostname 
$session = New-PSSession -ComputerName $computer

    write-host "Starting installs on $computer..." -ForegroundColor Green

        
        foreach($program in $programs){

#run through programs array to install apps
        invoke-command -session $session -ArgumentList $program {param($app)

#accepts all agreements 
        winget install --id $app --accept-source-agreements --accept-package-agreements


}
}
try{

write-host "removing session... on $computer" -ForegroundColor red

start-sleep -Seconds 2

Get-PSSession -ComputerName $computer | Disconnect-PSSession | Remove-PSSession

}catch{

Write-Host "unable to remove session, ending all sessions..."

get-pssession | remove-pssession 

}
}
}




function uninstalls{

#parameters to call functions in the main switch 
param(
        [string[]]$Programs,
        [string[]]$Computers)

foreach($computer in $computers){

#opens pssession for each computer listed in array by hostname 
$session = New-PSSession -ComputerName $computer

    write-host "Starting uninstalls on $computer..." -ForegroundColor Green

        
        foreach($program in $programs){

#run through programs array to uninstall apps
        invoke-command -session $session -ArgumentList $program {param($app)

        winget uninstall --id $app --accept-source-agreements

}
}
try{

write-host "removing session... on $computer" -ForegroundColor red

start-sleep -Seconds 2

Get-PSSession -ComputerName $computer | Disconnect-PSSession | Remove-PSSession

}catch{

Write-Host "unable to remove session, ending all sessions..."

get-pssession | remove-pssession 

}
}
}



#main switch function 
function Manage-Programs{

#array of programs by winget ID
$programs = @('Google.Chrome', '9MV0B5HZVK9Z' <#xbox#>, 'RProject.R')

#array of computers by host name 
$computers = @('DT092501')

do{

#switch menu selections 

    write-host "Select 1 to Install Programs" -ForegroundColor Yellow

    write-host "Select 2 to Uninstall Programs" -ForegroundColor Yellow

    write-host "Select q to quit" -ForegroundColor Yellow

    write-host "Please make a selection:" -ForegroundColor Yellow

$select = read-host

switch($select){

    '1'{write-host "Installing programs..." -ForegroundColor cyan
    installs -Programs $programs -Computers $computers}

    '2'{write-host "Uninstalling programs..." -ForegroundColor cyan
    uninstalls -Programs $programs -Computers $computers}

    'q' {Write-Host "Exiting..." -ForegroundColor Red}

#only numbers in the switch are valid             
default{
    Write-Host "Invalid selection, try again." -ForegroundColor red}
            
}

#waits so you can read the write-host before exiting 
Start-Sleep -Seconds 2
} while ($select -ne 'q') 
}

Manage-Programs
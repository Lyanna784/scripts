#setup script for new computers 


#DT092501


<#Setting up a new PC for Town of Poughkeepsie

- Startup the PC and connect to the network.
- Rename the PC
- Log In as Local Account
- Run Windows Updates
- Connect to the Domain (townofpoughkeepsie-ny.gov)
- Create local IT folder under C
- Copy backgrounds from S:\branding
- Set Admin Background
- Install Software
  - Sentinel One
  - Snap
  - Duo
  - Chrome 
  - Microsoft Office
  - Adobe Acrobat (free)
  - Munis (links)
  - Laserfiche
 - Remove from Task Bar
  - Microsoft Store
  - Outlook New#>



function upgrade-apps{

Write-Host "Starting app upgrades..."

try{
winget upgrade --all --silent --uninstall-previous 

write-host "Finished upgrading apps"
}catch{

write-host "Apps were unsuccessfully upgraded. Check internet connection or privileges." -ForegroundColor red

}

}


function checkUpdates{

Write-Host "Checking for system updates..."

cmd.exe /c "USOClient.exe StartInteractiveScan"


write-host "Downloading..."

cmd.exe /c "UsoClient StartDownload"


write-host "Installing..."

cmd.exe /c "UsoClient StartInstall"


Write-Host "Computer needs to restart to finish windows system updates. Would you like to restart(y/n)?"

$input = read-host 

if($input -eq "y"){

Restart-Computer

}else{

}


}


function create-folder{

Write-Host "Creating local IT folder..." -ForegroundColor Cyan

try{
new-item -path 'C:\IT' -ItemType directory 

write-host "Folder was sucessfully created." -ForegroundColor Green
}catch{

write-host "Folder unsuccessfully created, or already exists." -ForegroundColor red

}

}


function rename-PC{

write-host "Enter new computer name:"

$name = read-host

Rename-Computer -newname $name 

Write-Host "Computer needs to restart for new name to take effect. Would you like to restart(y/n)?"

$input = read-host 

if($input -eq "y"){

Restart-Computer

}else{

}
}


function installs{

#parameters to call functions in the main switch 

$computer = hostname 

    write-host "Starting installs on $computer..." -ForegroundColor Green

foreach($program in $installPrograms){
#run through programs array to install apps
        
#accepts all agreements 
winget install --id $program --accept-source-agreements --accept-package-agreements

}
}



function uninstalls{

#parameters to call functions in the main switch 

$computer = hostname 

    write-host "Starting installs on $computer..." -ForegroundColor Green

foreach($program in $uninstallPrograms){
#run through programs array to install apps
        
#accepts all agreements 
winget uninstall --id $program --accept-source-agreements --accept-package-agreements

}
}



#main switch function 
function Manage-Programs{


#array of programs by winget ID

$installPrograms = @(
'Google.Chrome', 
'Adobe.Acrobat.Reader.64-bit', 
'DuoSecurity.Duo2FAAuthenticationforWindows', 
'9WZDNCRDHL6D' <#munis#>)


$uninstallPrograms = @(
'9MV0B5HZVK9Z' <#xbox#>)


do{

#switch menu selections 

    write-host "Select 1 to Install Programs" -ForegroundColor Yellow

    write-host "Select 2 to Uninstall Programs" -ForegroundColor Yellow

    write-host "Select 3 to re-name PC" -ForegroundColor Yellow

    write-host "Select 4 to create a local IT folder" -ForegroundColor yellow 

    write-host "Select 5 to upgrade apps" -ForegroundColor Yellow

    Write-Host "Select 6 to update windows system" -ForegroundColor Yellow

    write-host "Select q to quit" -ForegroundColor Yellow

    write-host "Please make a selection:" -ForegroundColor Yellow

$select = read-host

switch($select){

    '1'{write-host "Installing programs..." -ForegroundColor cyan
    installs -Programs $programs -Computers $computers}

    '2'{write-host "Uninstalling programs..." -ForegroundColor cyan
    uninstalls -Programs $programs -Computers $computers}

    '3'{rename-PC}

    '4'{create-folder}

    '5'{upgrade-apps}

    '6'{checkUpdates}

    'q'{Write-Host "Exiting..." -ForegroundColor Red}

#only numbers in the switch are valid             
default{
    Write-Host "Invalid selection, try again." -ForegroundColor red}
            
}

#waits so you can read the write-host before exiting 
Start-Sleep -Seconds 2
} while ($select -ne 'q') 
}

Manage-Programs
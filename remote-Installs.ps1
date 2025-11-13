#remotely installs programs on target computers using winget from a server/admin computer

$computers = @('DT092501', 'TK062501')

#credential stored in encrypted xml
$cred = Import-Clixml -Path "C:\IT\Scripts\AdminCred.xml"

function installs{

foreach($computer in $computers){

write-host "Starting installs on $computer..." -ForegroundColor cyan


    Invoke-Command -ComputerName $computer -credential $cred -ScriptBlock {

    $programs = @('Google.Chrome', 'RProject.R') 

        foreach($app in $programs){

    write-host "Installing $app..." -ForegroundColor green

    winget install --id $app --accept-package-agreements --accept-source-agreements 

} 
}
}
}                                
 installs



 
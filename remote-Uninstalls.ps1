#remotely uninstalls programs from target computers using winget on server/admin computer

$computers = @('DT092501')

#credentials are stored in encrypted xml 
$cred = Import-Clixml -Path "C:\IT\Scripts\AdminCred.xml"

function Uninstalls{

foreach($computer in $computers){

write-host "Starting uninstalls on $computer..." -ForegroundColor cyan

    Invoke-Command -ComputerName $computer -credential $cred -ScriptBlock {

    $programs = @('Google.Chrome', 'RProject.R') 
    
        foreach($app in $programs){

        write-host "Uninstalling $app..." -ForegroundColor red

        winget uninstall --id $app --accept-source-agreements}



}
}
}                                
 Uninstalls



 
$name = hostname 

function usercheck{


$users = Get-LocalUser 

if(($users.name) -notcontains "sysadmin"){


New-LocalUser -name "sysadmin"       
Add-LocalGroupMember -group "administrators" -member "sysadmin"



}}


#$newname = Read-Host "enter a new name"

$dept = ""

#$department = read-host "what department is this for?"




function names{
$names = ""

do{


$entername = read-host "enter name"




switch($entername){



    1{$names = "Rob"}
    2{$names = "Rose"}
    3{$names = "Renata"}
    4{$names = "Lyanna"}


}





}while($entername -notin "1", "2", "3", "4")}



function department{

do{
 
write-host "what department is this for?"

write-host "biology"

write-host "psychology"

write-host "chemistry"

write-host "physics"

write-host "computer science"

$department = read-host "enter your selection"

$room = read-host "enter room number"

switch($department){




    1{$dept = "biology"}
    2{$dept = "psychology"}
    3{$dept = "chemistry"}
    4{$dept = "physics"}
    5{$dept = "cs"}
    default{}





}}while($department -notin "1", "2", "3", "4", "5")

$change = Rename-Computer -NewName ($dept + "-" +  $room.tostring())}






usercheck
department


function versioncheck{

$version = Get-ComputerInfo windowseditionid



if(($version.WindowsEditionId) -ne "education"){


write-host "not windows education"





}}






 winget install --id Google.Chrome -e

 winget install --id RProject.R -e

 winget install --id Microsoft.VisualStudioCode -e

 winget install --id Python.Python.3.12 -e

 winget install --id Posit.RStudio -e

#uninstalling registry paths to apps instead of winget method 

#using task scheduler instructions 



#credential for task scheduler 
$cred = Import-Clixml -Path "C:\IT\Scripts\AdminCred.xml"


#list of remote computers
$computers = @('DT092501')


#list of programs to uninstall (this will change)
$programs = @(
    "Google Chrome",
    "Adobe Acrobat (64-bit)"
)



foreach($computer in $computers){

    #remote command 
    Invoke-Command -ComputerName $computer -Credential $cred -ScriptBlock {

        param($programs)

        #registry paths to uninstall apps 32-bit amd 64-bit 
        $paths = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall",
                 "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"

        foreach($app in $programs){

        #searching through registry for app names (this will be different for each app)
            $item = foreach($path in $paths){
                Get-ChildItem $path |
                    Get-ItemProperty |
                    Where-Object { $_.DisplayName -eq $app }}

            if($item.UninstallString){
                cmd.exe /c "$($item.UninstallString) /quiet /norestart"} 
                else {
              
}
}} -ArgumentList $programs
}

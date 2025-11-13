## Remote task winget array
# Uses copy file method and runs under user context

##the script is copying to the other machine. not running after 
##testing user context and credential issues 

$computers = @('DT092501', 'TK062501')

$localScript = '.\winget-test.ps1'
$remoteScript = 'C:\IT\winget-test.ps1'

# 24hr clock

foreach($i in $computers) {

cd "C:\IT"

    # Create session
    $session = New-PSSession -ComputerName $i

    try {
        Write-Host "Script is running on computer $i" -ForegroundColor Yellow

        # Ensure destination folder exists on remote machine
        Invoke-Command -Session $session -ScriptBlock {
            $folder = Split-Path -Parent 'C:\IT\winget-test.ps1'
            if (-not (Test-Path $folder)) {
                New-Item -Path $folder -ItemType Directory | Out-Null}
            
        }

        # Copy the script
        Copy-Item -Path $localScript -Destination $remoteScript -ToSession $session -Force

        # Create scheduled task to run as currently logged-in user
        Invoke-Command -Session $session -ScriptBlock {
            $scriptPath = 'C:\IT\winget-test.ps1'

            # Get currently logged-in user (interactive session)
            $currentUser = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName

            if ($currentUser) {
                schtasks /create /tn "WingetUserInstall" /tr "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" /sc once /st 13:57 /ru "$currentUser" /f
            }
            else {
                Write-Host "No interactive user found. Cannot create user-level scheduled task."
            }
        } -ErrorAction Stop

        Write-Host "Script copied, scheduled task created for user, and ready to run." -ForegroundColor Green

        Remove-PSSession -Session $session
    }
    catch {
        Write-Error "Error: $_"
        Remove-PSSession -Session $session
    }
}

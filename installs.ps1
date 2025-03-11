function install{
 
 winget install --id Google.GoogleDrive -e

 winget install --id Zoom.Zoom -e

 #winget install --id Adobe.CreativeCloud -e #installer failed?
 #adobe creative cloud id below 
 winget install --id XPDLPKWG9SW2WD -e #have to press [y] and free up space

 winget install --id Adobe.Acrobat.Reader.64-bit -e

 }




function uninstall{

 winget uninstall --id Microsoft.OneDrive

 winget uninstall --id Microsoft.Teams

 winget uninstall --id 9NZKPSTSNW4P #uninstall game bar

 winget uninstall --name "Phone Link" #couldn't find id

 winget uninstall --name "News" #--id 9WZDNCRFHVFW
 #winget uninstall --id 9WZDNCRFHVFW 

 winget uninstall --name "Outlook for Windows" #--id 9NRX63209R7B
 #winget uninstall --id 9NRX63209R7B

 winget uninstall --name "Solitaire & Casual Games" #--id [MSIX\Microsoft.MicrosoftSolitaireCollection_4.21.12110.0_x64__8wekyb3d8bbwe]
 #winget uninstall --id [MSIX\Microsoft.MicrosoftSolitaireCollection_4.21.12110.0_x64__8wekyb3d8bbwe]

 winget uninstall --name "Xbox TCUI" #--id [MSIX\Microsoft.Xbox.TCUI_1.24.10001.0_x64__8wekyb3d8bbwe]
 #winget uninstall --id [MSIX\Microsoft.Xbox.TCUI_1.24.10001.0_x64__8wekyb3d8bbwe]

 winget uninstall --name "Xbox identity provider" #--id [MSIX\Microsoft.XboxIdentityProvider_12.115.1001.0_x64__8wekyb3d8bbwe]
 #winget uninstall --id [MSIX\Microsoft.XboxIdentityProvider_12.115.1001.0_x64__8wekyb3d8bbwe]

 winget uninstall --name "Xbox" #--id [MSIX\Microsoft.GamingApp_2502.1001.6.0_x64__8wekyb3d8bbwe]
 #winget uninstall --id [MSIX\Microsoft.GamingApp_2502.1001.6.0_x64__8wekyb3d8bbwe]

 winget uninstall --name "Game Speech Window" #--id [MSIX\Microsoft.XboxSpeechToTextOverlay_1.97.17002.0_x64__8wekyb3d8bbwe]
 #winget uninstall --id [MSIX\Microsoft.XboxSpeechToTextOverlay_1.97.17002.0_x64__8wekyb3d8bbwe]

 }
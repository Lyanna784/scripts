

$programs = @('Google.Chrome', 'RProject.R')


foreach($app in $programs){

winget install --id $app --accept-source-agreements --accept-package-agreements

}
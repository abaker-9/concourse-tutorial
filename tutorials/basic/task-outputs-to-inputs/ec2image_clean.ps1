param (
  $ImageName = $env:ImageName,
  $Region = $env:Region,
  $AccessKey = $env:AccessKey,
  $SecretKey = $env:SecretKey
)

#write-output "Name is $ImageName"

#Install module
Find-Module AWSPowerShell.NetCore|Install-module -force -AllowClobber -SkipPublisherCheck

#Initialize
Set-AWSCredential -AccessKey $AccessKey -SecretKey $SecretKey -StoreAs MyProfileName
Initialize-AWSDefaultConfiguration -ProfileName MyProfileName -Region $Region

#unregister matching images
Get-EC2Image -Owner self|Where-Object name -match $ImageName|Sort-Object creationdate -desc|Select-Object -skip 2|Unregister-EC2Image -whatif

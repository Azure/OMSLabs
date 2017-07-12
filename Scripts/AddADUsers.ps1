param(
 [string]$AdDomain = "DC=contoso,DC=com",
 [string]$AdUpnSuffix = "@contoso.com",
 [string]$Password = "Passw0rd2017!"
)
$ErrorActionPreference = 'Stop'
Write-Host 
Write-Host " Creating additional accounts!" -ForegroundColor Green
Write-Host " Script Steps:" -ForegroundColor White
Write-Host " (0) Validating parameters..." -ForegroundColor White
Write-Host " (1) Importing Active Directory Windows PowerShell Module..." -ForegroundColor White
Write-Host " (2) Creating Additional Accounts ..." -ForegroundColor White
# create reference to AD OU "Users" and secure password string 
$AdOuUsers = "CN=Users,"+$AdDomain
$UserPassword = ConvertTo-SecureString -AsPlainText $Password -Force
#
# verify parameters passed in
#
Write-Host "(0) Validating parameters..." -ForegroundColor White
# AD domain
if ($AdDomain -eq $null -xor $AdDomain -eq ""){
 Write-Error '$AdDomain is required'
 Exit
}
# password
if ($Password -eq $null -xor $Password -eq ""){
 Write-Error '$Password is required'
 Exit
}
# import AD module
Write-Host "(1) Importing Active Directory Windows PowerShell Module..." -ForegroundColor White
Import-Module ActiveDirectory
Write-Host "    .. module loaded" -ForegroundColor Gray 
function CreateNewAdUser([string]$username)
{
  $userPrincipalName = $username + $AdUpnSuffix
  $newUser = New-ADUser -Path $AdOuUsers -SamAccountName $username -Name $username -DisplayName $username -EmailAddress $userPrincipalName -UserPrincipalName $userPrincipalName -Enabled $true -ChangePasswordAtLogon $false -CannotChangePassword $true -PassThru -PasswordNeverExpires $true -AccountPassword $UserPassword
  Write-Host "    Created user $username" -ForegroundColor Gray 
}
Set-AdUser adAdministrator -CannotChangePassword $true -PasswordNeverExpires $true
# create users
Write-Host "(2) Creating developer account" -ForegroundColor White
CreateNewAdUser "Developer"
Write-Host "(3) Creating End User account" -ForegroundColor White
CreateNewAdUser "EndUser"
CreateNewAdUser "Alerts"
CreateNewAdUser "Assets"
CreateNewAdUser "Assistance"
CreateNewAdUser "Billing"
CreateNewAdUser "CIO"
CreateNewAdUser "Cloud"
CreateNewAdUser "Compliance"
CreateNewAdUser "Engineering"
CreateNewAdUser "Executive"
CreateNewAdUser "Finance"
CreateNewAdUser "HR"
CreateNewAdUser "IT"
CreateNewAdUser "Legal"
CreateNewAdUser "Marketing"
CreateNewAdUser "Questions"
CreateNewAdUser "Research"
CreateNewAdUser "Sales"
CreateNewAdUser "Security"
CreateNewAdUser "Services"
CreateNewAdUser "SQLAdmin"
CreateNewAdUser "SQLInstaller"
CreateNewAdUser "Support"
CreateNewAdUser "Tier1"
CreateNewAdUser "Tier2"
CreateNewAdUser "Tier3"
CreateNewAdUser "Announcements"
CreateNewAdUser "Builds"
CreateNewAdUser "Deployments"
CreateNewAdUser "DevOps"
CreateNewAdUser "Operations"
CreateNewAdUser "Peggy"
CreateNewADUser "Gustav"
CreateNewADUser "Patrick"
CreateNewADUser "Silvia"

Add-ADGroupMember -Identity "Domain Admins" -Members Peggy

Write-Host 
Write-Host "Finished creating additional accounts!" -ForegroundColor Green
Write-Host


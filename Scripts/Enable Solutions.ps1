$RGName = "demo-rg"
$WSName = "DEMO-WS"

#login
login-AzureRmAccount
#select sub
Select-AzureRmSubscription -SubscriptionId 80cab596-5c00-4198-80ff-b04fb7a81f8b
#	List Solutions in Log analytics:
Get-AzureRmOperationalInsightsIntelligencePacks -ResourceGroupName $RGName -WorkspaceName $WSName
#enable solution
 Set-AzureRmOperationalInsightsIntelligencePack -ResourceGroupName $RGName -WorkspaceName $WSName -IntelligencePackName "ServiceDesk" -Enabled $True
 #if cmdlets are missing - please install the latest and greatestInstall-Module -Name AzureRM
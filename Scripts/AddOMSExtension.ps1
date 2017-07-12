Login-AzureRmAccount -Credential (Get-Credential -Message 'ARM')
$subId = ''
$workspaceId = ''
$workspaceKey = ''
Select-AzureRmSubscription -SubscriptionId $subId
$vms = Get-AzureRmVM | Out-GridView -PassThru

Foreach ($vm in $vms)
{
    $vm.Name
    Get-Date
    Set-AzureRmVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -Name 'MicrosoftMonitoringAgent' -Publisher 'Microsoft.EnterpriseCloud.Monitoring' -ExtensionType 'MicrosoftMonitoringAgent' -TypeHandlerVersion '1.0' -Location $vm.Location -SettingString "{'workspaceId': '$workspaceId'}" -ProtectedSettingString "{'workspaceKey': '$workspaceKey'}" -Verbose
}

# Check extension status
$vms | % { Get-AzureRmVMExtension -ResourceGroupName $_.ResourceGroupName -VMName $_.Name -Name 'MicrosoftMonitoringAgent' } | ft VMName, Name, ProvisioningState 

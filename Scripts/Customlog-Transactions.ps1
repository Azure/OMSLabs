############################################ Script Start ############################################### 

$newline = “`r`n”
$sLogDir = "C:\TempLogs" 
$sLogFile = "SampleApplication.log"

New-Item -ItemType Directory -Force -Path $sLogDir

$TRANX001AvgResponseTime = [math]::round((Get-Random -min 3.11 -max 30.55),2) 
$TRANX002AvgResponseTime = [math]::round((Get-Random -min 6.11 -max 50.55),2) 
$TRANX003BAvgResponseTime = [math]::round((Get-Random -min 1.11 -max 60.55),2) 
$TRANX017RAvgResponseTime = [math]::round((Get-Random -min 4.11 -max 40.55),2) 
$TRANX007AvgResponseTime = [math]::round((Get-Random -min 2.11 -max 25.55),2) 
$TRANX063AvgResponseTime = [math]::round((Get-Random -min 5.11 -max 26.55),2) 
$TRANX15bAvgResponseTime = [math]::round((Get-Random -min 7.11 -max 42.55),2)

$theDay = get-date -format yyyy-MM-dd

$theTime1 = (Get-Date).AddSeconds(-10).ToString(‘hh:mm:ss’) 
$string1 = $theDay + ” ” + $theTime1 + “|Transaction:TRANX001|Type:TransactionTypeA|Description:TRANX001 is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX001AvgResponseTime + “`”” + $newline

$theTime2 = (Get-Date).AddSeconds(-20).ToString(‘hh:mm:ss’) 
$string2 = $theDay + ” ” + $theTime2 + “|Transaction:TRANX002|Type:TransactionTypeA|Description:TRANX002 is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX002AvgResponseTime + “`”” + $newline

$theTime3 = (Get-Date).AddSeconds(-30).ToString(‘hh:mm:ss’) 
$string3 = $theDay + ” ” + $theTime3 + “|Transaction:TRANX003B|Type:TransactionTypeB|Description:TRANX003B is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX003BAvgResponseTime + “`”” + $newline

$theTime4 = (Get-Date).AddSeconds(-40).ToString(‘hh:mm:ss’) 
$string4 = $theDay + ” ” + $theTime4 + “|Transaction:TRANX017R|Type:TransactionTypeC|Description:TRANX017R is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX017RAvgResponseTime + “`”” + $newline

$theTime5 = (Get-Date).AddSeconds(-50).ToString(‘hh:mm:ss’) 
$string5 = $theDay + ” ” + $theTime5 + “|Transaction:TRANX007|Type:TransactionTypeC|Description:TRANX007 is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX007AvgResponseTime + “`”” + $newline

$theTime6 = (Get-Date).AddSeconds(-60).ToString(‘hh:mm:ss’) 
$string6=$theDay + ” ” + $theTime6 + “|Transaction:TRANX063|Type:TransactionTypeA|Description:TRANX063 is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX063AvgResponseTime + “`”” + $newline

$theTime7 = (Get-Date).AddSeconds(-70).ToString(‘hh:mm:ss’) 
$string7=$theDay + ” ” + $theTime7 + “|Transaction:TRANX15b|Type:TransactionTypeB|Description:TRANX15b is  …. |Metric:Avg. Resp. Time [ms]|ResponseTime:” + $TRANX15bAvgResponseTime + “`””

$string1+$string2+$string3+$string4+$string5+$string6+$string7 | Out-File -Append -Encoding ASCII $sLogDir"\"$sLogFile

#Writes formatted strings to destination “C:\TempPath\SampleApplication5.log” 
       

########################################## Script End ################################################# 

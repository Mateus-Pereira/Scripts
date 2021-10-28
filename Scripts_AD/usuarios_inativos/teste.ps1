# $Days = 90
# $Time = (Get-Date).Adddays(-($Days))
# (Get-ADUser -Filter {LastLogonTimeStamp -lt $Time} -Properties * | Select Name, LastLogonDate).count




#(Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonTimeStamp | Select Name, LastLogonDate).count

(Get-ADUser -Filter 'Enabled -eq $false' -Properties LastLogonDate | Where-Object {$_.LastLogonDate -lt (Get-Date).AddYears(-1)}).count

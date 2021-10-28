(Get-ADUser -Filter 'Enabled -eq $True' -Properties PasswordLastSet | Where-Object {$_.PasswordLastSet -lt (Get-Date).AddYears(-1)}).count




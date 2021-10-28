# (Get-ADComputer -Filter {Enabled -eq $false} -Properties DNSHostName | Where-Object {$_.DNSHostName -like "*araujo.corp*"}).count

Get-ADComputer -Filter {Enabled -eq $false} -Properties DNSHostName | Where-Object {$_.DNSHostName -like "*araujo.corp*"}
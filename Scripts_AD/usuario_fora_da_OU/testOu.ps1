(Get-ADUser -Filter * -Properties DistinguishedName | Where-Object {$_.DistinguishedName -like "*cn=users,DC=araujo,DC=corp*"}).count


#$user.DistinguishedName -like "*cn=users,DC=araujo,DC=corp*"
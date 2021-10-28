cls
$Users = Get-ADUser -Filter *
$i = 0
foreach($user in $users)
{

    if($user.DistinguishedName -like "*cn=users,DC=araujo,DC=corp*")
    {
        $user.DistinguishedName  
        $i++
    }

}
Write-Host $i
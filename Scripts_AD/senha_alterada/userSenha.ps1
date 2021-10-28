$i = 0

$password = (Get-ADUser -Filter {enabled -eq $true}  -Properties PasswordLastSet)

foreach ($user in $password) {

    $passwordLastSet = $user.PasswordLastSet
    if($user.PasswordLastSet -lt (Get-Date).AddYears(-1))
        {
            Write-Host  $User.Name "-" $PasswordLastSet "-" (Get-Date).AddYears(-1)
            $i++
        }


}
Write-Host "total de usuarios a mais de um ano sem altera a senha:" $i
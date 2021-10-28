cls

$usuarios = (Get-ADUser -Filter {LastLogonTimeStamp -lt $Time} -Properties * | Select Name, LastLogonDate) 
$Days = 10
$Time = (Get-Date).Adddays(-($Days))

#foreach ($item in $usuarios) {

#}


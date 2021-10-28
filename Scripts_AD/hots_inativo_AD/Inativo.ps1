
# $logfile = "C:\scripts\hots_inativo_AD" + (Get-Date -Format yyyy_MM_dd_HHmmss) + "maquinas.csv"
# $output = "nome; dia; hora" | Out-File $logfile


# $maquinas = (Get-ADComputer -Filter { LastLogonTimeStamp -lt $Time } -Properties * | Select Name, LastLogonDate) 
# $Days = 90
# $Time = (Get-Date).Adddays( - ($Days))

# foreach ($item in $maquinas) {

#     $output = $maquinas  |  Out-File $logfile 
# }

cls

$Days = 1
$Time = (Get-Date).Adddays(-($Days))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $Time} -Properties * | Select Name, LastLogonDate

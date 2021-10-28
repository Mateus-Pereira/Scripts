$logfile = "C:\scripts\DNS\result"+ (Get-Date -Format yyyy_MM_dd_HHmmss) + "_get_log.txt"
$output = "name;statusping;dns1;dns2" | Out-File $logfile

$maquinas = (get-adcomputer -filter{name -like "#nome da maquina"}).name
foreach($maquina in $maquinas)
{
    $maquina
    $dns = $null
    $statusping = "falha"
    if(Test-Connection $maquina -Count 1 -ErrorAction SilentlyContinue)
    {
        $statusping = "PING OK"
        $NICs = Get-WMIObject Win32_NetworkAdapterConfiguration -computername $maquina | where{$_.IPEnabled -eq “TRUE”}
       
        $dns = $NICs.DNSServerSearchOrder
        $dns = $dns.split(" ")
        $output = $maquina + ";" + $statusping + ";" + $dns[0] + ";" + $dns[1] | Out-File $logfile -Append  


    }
    else
    {
        $output = $maquina + ";" + $statusping + ";N/A;N/a" | Out-File $logfile -Append  
    }

} 


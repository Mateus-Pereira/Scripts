$logfile = "$PSScriptRoot/processador_socket_log.txt"

"Name;Ping;CPU;SocketDesignation" > $logfile

$computers = (Get-ADComputer -Filter { name -like "#nome do computador"}).name | Sort-Object

$total = $computers.Count
$i = 0

foreach($item in $computers)
{
    $linha = ""
    $linha += $item + ";"
        
    if(Test-Connection $item -Count 1 -ErrorAction SilentlyContinue)
    {
        $linha += "OK" + ";"
        $aux = Get-WmiObject -Class Win32_Processor -ComputerName $item

        if($aux.name -eq "Intel(R) Core(TM) i5-7500 CPU @ 3.40GHz" -and $aux.SocketDesignation -eq "U3E1")
        {
            $linha += $aux.name + ";" + $aux.SocketDesignation
            Write-Host $item $aux.name $aux.SocketDesignation -ForegroundColor Green
        }
    }
    else
    {
        $linha += "ERRO"
        Write-Host $item -ForegroundColor Red
    }

    $completo = [math]::Round($i * 100 / $total, 2)
    Write-Progress -Activity "Searching Events" -Status "Progress: $completo %  -  $i / $total " -PercentComplete $completo
    $i++

    $linha >> $logfile
}
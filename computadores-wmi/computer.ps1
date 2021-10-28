$logfile = "C:\scripts\computadores-wmi\relatorio.txt"
$output = "nome;status" | Out-File $logfile

$maquinas = get-adcomputer -Filter {name -like "lj*"} | Sort-Object | %{
    $status = ""
    #$_.name
    $key = $_.name
    if(Test-Connection $key -Count 1 -ErrorAction SilentlyContinue)
    {
        if(Get-WmiObject -Class Win32_Service -ComputerName $key -ErrorAction SilentlyContinue)
        {
        Write-Host $key "wmi ok" -ForegroundColor Green
           $status = "wmi ok"
        }else{Write-Host $key "wmi falha" -ForegroundColor yellow
            $status = "wmi falha"
        }
    }
    else
    {
        Write-Host $key -ForegroundColor red
        $status = "desligado"
    }
    $output = $_.name + ";" + $status  >> $logfile 

}


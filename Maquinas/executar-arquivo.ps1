$maquinas = Get-Content C:\scripts\Executaarquivo\maquinas.txt
 foreach($maquina in $maquinas)
 {

 
   # teste de ping no pc
    if(Test-Connection $maquina -Count 1 -ErrorAction SilentlyContinue)
    {
        Write-Host $maquina -ForegroundColor Green
        #cria pasta temporaria
        $destino = "\\" + $maquina + "\c$\temp\"
        if(Test-Path $destino){}else{New-Item $destino -ItemType Directory}
       
        #copia script
        Copy-Item "C:\scripts\Executaarquivo\acertawsus.bat" -Destination $destino

        #roda script
         $RunEXE="c:\temp\acertawsus.bat"

        $proc=([WMICLASS]"\\$maquina\ROOT\CIMV2:win32_process").Create($runEXE)
        While((Get-WmiObject Win32_Process -computername $maquina -filter "ProcessID='$($proc.ProcessID)'") -or ($timeout -eq 10)){start-sleep -seconds 2
        $timeout++}

    }
    else
    {
        Write-Host $maquina -ForegroundColor Red
    }
 }
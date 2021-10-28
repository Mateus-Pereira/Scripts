$key = 0

do
{
$key = 1
cls
sleep 6
$maquinas = (Get-adcomputer -Filter{(name -like "#nome da maquina") -and (name -notlike "*gerente*")}).name

foreach($maquina in $maquinas)
{

   # $maquina

    if((Test-Connection $maquina -Count 1 -ErrorAction SilentlyContinue))
    {
        Write-Host $maquina -ForegroundColor Green


        #verifica troca
        $caminhotroca = "\\" + $maquina + "\c$\cosmos\exe\TrocaDevolucao.exe"
        if(Test-Path $caminhotroca -ErrorAction SilentlyContinue)
        {
            Write-Host $caminhotroca -ForegroundColor Green
            Get-ChildItem $caminhotroca | Remove-Item -ErrorAction SilentlyContinue -Force
            $key = 0

        }
        else
        {
            Write-Host $caminhotroca -ForegroundColor red
        }

        #verifica cosmos bc
        $caminhobc = "\\" + $maquina + "\c$\cosmos\exe\cosmosbc.exe"
        if(Test-Path $caminhobc -ErrorAction SilentlyContinue)
        {
            Write-Host $caminhobc -ForegroundColor Green
            Get-ChildItem $caminhobc | Remove-Item -ErrorAction SilentlyContinue -Force
            $key = 0
        }
        else
        {
            Write-Host $caminhobc -ForegroundColor red
        }
   

        " "

    }
    else
    {
         Write-Host $maquina -ForegroundColor red
    }

   

}
}while($key -eq 0)

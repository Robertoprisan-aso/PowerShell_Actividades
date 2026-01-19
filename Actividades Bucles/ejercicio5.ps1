$numero = Read-Host "Introduce un número para ver su tabla de multiplicar"
$numero = [int]$numero

for ($i = 1; $i -le 10; $i++) {
    $resultado = $numero * $i
    Write-Host "$numero x $i = $resultado"
}

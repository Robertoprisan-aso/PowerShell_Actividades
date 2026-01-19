$nombre = Read-Host "Introduce tu nombre"
$numero = Read-Host "Introduce un número entero"
$numero = [int]$numero

for ($i = 1; $i -le $numero; $i++) {
    Write-Host $nombre
}

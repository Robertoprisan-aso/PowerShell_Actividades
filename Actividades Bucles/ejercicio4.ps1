$numero = Read-Host "Introduce un número entero positivo"
$numero = [int]$numero

for ($i = 1; $i -le $numero; $i += 2) {
    if ($i -ge ($numero - 1)) {
        Write-Host $i
    } else {
        Write-Host "$i," -NoNewline
    }
}

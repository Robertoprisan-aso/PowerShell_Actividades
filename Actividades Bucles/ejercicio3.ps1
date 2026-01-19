$numero = Read-Host "Introduce un número entero positivo"
$numero = [int]$numero

for ($i = $numero; $i -ge 0; $i--) {
    if ($i -eq 0) {
        Write-Host $i
    } else {
        Write-Host "$i," -NoNewline
    }
}

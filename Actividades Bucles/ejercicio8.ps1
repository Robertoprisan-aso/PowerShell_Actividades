$altura = Read-Host "Introduce la altura del triángulo"
$altura = [int]$altura

for ($i = 1; $i -le $altura; $i++) {

    # Último impar de la fila
    $maxImpar = (2 * $i) - 1

    for ($j = $maxImpar; $j -ge 1; $j -= 2) {
        Write-Host "$j " -NoNewline
    }

    Write-Host ""
}

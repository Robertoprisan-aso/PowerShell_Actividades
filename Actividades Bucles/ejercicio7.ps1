$altura = Read-Host "Introduce la altura del triángulo"
$altura = [int]$altura

for ($i = 1; $i -le $altura; $i++) {
    Write-Host ("*" * $i)
}

$edad = Read-Host "Introduce tu edad"
$edad = [int]$edad

for ($i = 1; $i -le $edad; $i++) {
    Write-Host $i
}

[int] $edad = Read-Host "introduce el numero"

if ($edad -gt 18) {
    Write-Host "es mayor de edad"
} else {
    Write-Host "es menor de edad"
}
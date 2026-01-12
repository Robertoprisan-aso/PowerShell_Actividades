[int] $horas = Read-Host "introduce el numero de horas"
[int] $coste = Read-Host "introduce el coste por hora"

$salario = $horas * $coste 

Write-Host "El salario es: $salario €"
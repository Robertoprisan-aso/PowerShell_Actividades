[int] $num1 = Read-Host "introduce el numero 1"
[int] $num2 = Read-Host "introduce el numero 2"

$suma = $num1 + $num2
$resta = $num1 - $num2
$multiplicacion = $num1 * $num2
$division = $num1 / $num2
$resto = $num1 % $num2

Write-Host "Suma: $suma"
Write-Host "Resta: $resta"
Write-Host "Multiplicacion: $multiplicacion"
Write-Host "Division: $division"
Write-Host "Resto: $resto"
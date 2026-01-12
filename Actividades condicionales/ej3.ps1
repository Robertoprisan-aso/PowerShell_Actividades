[int] $num1 = Read-Host "introduce el numero 1"
[int] $num2 = Read-Host "introduce el numero 2"

if ($num1 -lt $num2) {
    Write-Host "el num2 es mayor: $num2 > $num1"
} if ($num1 -eq $num2) {
    Write-Host "los numeros son iguales: $num1 == $num2"
} if ($num1 -gt $num2) {
    Write-Host "El numero 1 es mayor: $num1 > $num2"
}
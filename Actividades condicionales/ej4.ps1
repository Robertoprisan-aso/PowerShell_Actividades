[int] $num1 = Read-Host "introduce el numero 1"
[int] $num2 = Read-Host "introduce el numero 2"

[Int]$x = Read-Host "****** CALCULADORA ********

    1. Sumar
    2. Restar 
    3. Multiplicar
    4. Dividir
    ¿Qué desea hacer?Elige una opción:
"
switch ($x) { 
	1 {
		$suma = $num1 + $num2
		Write-Host "La suma es: $suma "
	}
	2 {
		$resta = $num1 - $num2
		Write-Host "La resta es: $resta"
	}
	3 {
		$multiplicacion = $num1 * $num2
		Write-Host "La multiplicacion es: $multiplicacion"
	}
    4 {
		$division = $num1 / $num2
		Write-Host "La division es: $division"
	}
	default {
		Write-Host "Has introducido cualquier otro valor"
	}
}

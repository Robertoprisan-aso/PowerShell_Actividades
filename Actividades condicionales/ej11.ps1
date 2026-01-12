$edad = Read-Host "Introduce la edad del cliente"
$edad = [int]$edad

if ($edad -lt 4) {
    $precio = 0
}
elseif ($edad -le 18) {
    $precio = 5
}
else {
    $precio = 10
}

Write-Host "El precio de la entrada es: $precio €"

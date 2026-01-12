$puntos = Read-Host "Introduce la puntuación del empleado (0.0, 0.4, 0.6 o más)"
$puntos = [double]$puntos

if ($puntos -eq 0.0) {
    $nivel = "Inaceptable"
}
elseif ($puntos -eq 0.4) {
    $nivel = "Aceptable"
}
elseif ($puntos -ge 0.6) {
    $nivel = "Meritorio"
}
else {
    Write-Host "Puntuación NO válida."
    exit
}

$dinero = 2400 * $puntos

Write-Host "Nivel: $nivel"
Write-Host "Puntuación: $puntos"
Write-Host "Cantidad obtenida: $dinero €"

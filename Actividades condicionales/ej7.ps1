$mayus = "contraseña"

$nombre = Read-Host "Introduce la contraseña"

if ($intro.ToLower() -eq $guardada.ToLower()) {
    Write-Host "Contraseña CORRECTA."
} else {
    Write-Host "Contraseña INCORRECTA."
}

$correcta = "contraseña"
$introducida = ""

while ($introducida -ne $correcta) {
    $introducida = Read-Host "Introduce la contraseña"

    if ($introducida -ne $correcta) {
        Write-Host "Contraseña incorrecta. Inténtalo de nuevo."
    }
}

Write-Host "✅ Contraseña correcta. Acceso permitido."

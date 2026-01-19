# Número secreto fijo
$secreto = 42

Write-Host "🎯 Juego: Adivina el número (entre 0 y 100)"

do {
    $intento = Read-Host "Introduce un número"
    $intento = [int]$intento

    if ($intento -lt $secreto) {
        Write-Host "El número secreto es MAYOR."
    }
    elseif ($intento -gt $secreto) {
        Write-Host "El número secreto es MENOR."
    }
    else {
        Write-Host "🎉 ¡Enhorabuena! Has adivinado el número."
    }

} while ($intento -ne $secreto)

$nombre = Read-Host "Introduce tu nombre"
$sexo   = Read-Host "Introduce tu sexo (M/F)"

$nombre = $nombre.Trim()
$sexo   = $sexo.Trim().ToUpper()

# Primera letra del nombre (en mayúscula)
$letra = $nombre.Substring(0,1).ToUpper()

$grupo = "B"

if (($sexo -eq "F" -and $letra -lt "M") -or ($sexo -eq "M" -and $letra -gt "N")) {
    $grupo = "A"
}

Write-Host "Te corresponde el grupo $grupo."

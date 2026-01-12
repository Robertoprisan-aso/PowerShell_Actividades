$renta = Read-Host "Introduce tu renta anual en euros"
$renta = [double]$renta

if ($renta -lt 10000) {
    $tipo = 5
}
elseif ($renta -lt 20000) {
    $tipo = 15
}
elseif ($renta -lt 35000) {
    $tipo = 20
}
elseif ($renta -lt 60000) {
    $tipo = 30
}
else {
    $tipo = 45
}

Write-Host "Para una renta de $renta € el tipo impositivo es del $tipo%."

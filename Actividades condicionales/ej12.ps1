Write-Host "Bienvenido a la pizzería Bella Napoli"
$tipo = Read-Host "¿Quieres una pizza vegetariana? (s/n)"
$tipo = $tipo.ToLower()

if ($tipo -eq "s") {
    $vegetariana = $true
    Write-Host "Ingredientes vegetarianos disponibles:"
    Write-Host "1. Pimiento"
    Write-Host "2. Tofu"
}
elseif ($tipo -eq "n") {
    $vegetariana = $false
    Write-Host "Ingredientes no vegetarianos disponibles:"
    Write-Host "1. Peperoni"
    Write-Host "2. Jamón"
    Write-Host "3. Salmón"
}
else {
    Write-Host "Opción no válida"
    exit
}

$opcion = Read-Host "Elige un ingrediente (número)"

switch ($opcion) {
    "1" { $ingrediente = if ($vegetariana) { "Pimiento" } else { "Peperoni" } }
    "2" { $ingrediente = if ($vegetariana) { "Tofu" } else { "Jamón" } }
    "3" { 
        if (-not $vegetariana) {
            $ingrediente = "Salmón"
        } else {
            Write-Host "Opción no válida"
            exit
        }
    }
    default {
        Wr

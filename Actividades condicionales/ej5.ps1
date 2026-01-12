
$nombre = Read-Host "Introduce el nombre del fichero o carpeta"


if (Test-Path $nombre) {
    Write-Host "El fichero o carpeta $nombre EXISTE."
} else {
    Write-Host "El fichero o carpeta $nombre NO existe."
}

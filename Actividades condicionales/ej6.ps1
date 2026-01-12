$nombre = Read-Host "Introduce el nombre del directorio (en el directorio actual)"

if (Test-Path $nombre) {
    $item = Get-Item $nombre

    if ($item.PSIsContainer) {
        Write-Host "$nombre ES un directorio"
        Get-ChildItem -Path $nombre -Recurse 
    } else {
        Write-Host "$nombre NO es un directorio"
    }
} else {
    Write-Host "No existe '$nombre' en el directorio actual."
}

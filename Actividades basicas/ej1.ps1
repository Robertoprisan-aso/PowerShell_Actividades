$usuario = $env:USERNAME
$directorio = Get-Location
$dominio = $env:USERDOMAIN
$equipo = $env:COMPUTERNAME


Write-Host "Hola $usuario"
Write-Host "Directorio actual: $directorio"
Write-Host "Perteneces al dominio $dominio"
Write-Host "Nombre del equipo: $equipo"
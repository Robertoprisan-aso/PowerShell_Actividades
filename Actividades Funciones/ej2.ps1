$usuarios = Import-Csv "C:\Users\Administrador\Desktop\actividades\PowerShell_Actividades\Actividades Funciones"

foreach ($usuario in $usuarios) { 
    Write-Host "Nombre: $(usuario.Nombre)"
    Write-Host "Apellidos: $(usuario.Apellidos)"
    Write-Host "Grupo: $(usuario.Grupo)"
    Write-Host "---- TERMINADO -----"
}
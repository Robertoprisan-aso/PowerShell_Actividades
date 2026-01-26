Import-Module ActiveDirectory

$ruta = "C:\ASO"
$departamentosCSV = "$ruta\departamentos.csv"
$empleadosCSV = "$ruta\empleados.csv"

$dominioDN = "DC=empresa,DC=local"
$password = ConvertTo-SecureString "aso2025." -AsPlainText -Force

# ------------------------------------------------------
# 1. OU EMPRESA
# ------------------------------------------------------
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Empresa'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Empresa" -Path $dominioDN
    Write-Host "OU Empresa creada" -ForegroundColor Green
}
else {
    Write-Host "OU Empresa ya existe" -ForegroundColor Yellow
}

# ------------------------------------------------------
# 2. OUs Y GRUPOS DEPARTAMENTOS
# ------------------------------------------------------
$departamentos = Import-Csv $departamentosCSV -Delimiter ";"

foreach ($dep in $departamentos) {

    $nombreDep = $dep.departamento.Trim()
    $descripcion = $dep.descripcion.Trim()
    $rutaEmpresa = "OU=Empresa,$dominioDN"

    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$nombreDep'" -SearchBase $rutaEmpresa -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $nombreDep -Path $rutaEmpresa -Description $descripcion
        Write-Host "OU $nombreDep creada" -ForegroundColor Green
    }

    if (-not (Get-ADGroup -Filter "Name -eq '$nombreDep'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $nombreDep -GroupScope Global -GroupCategory Security `
            -Path "OU=$nombreDep,OU=Empresa,$dominioDN"
        Write-Host "Grupo $nombreDep creado" -ForegroundColor Green
    }
}

# ------------------------------------------------------
# 3. USUARIOS
# ------------------------------------------------------
$empleados = Import-Csv $empleadosCSV -Delimiter ";"

foreach ($emp in $empleados) {

    $nombre = $emp.nombre.Trim()
    $apellido = $emp.apellido.Trim()
    $departamento = $emp.departamento.Trim()

    if ($nombre -eq "" -or $apellido -eq "" -or $departamento -eq "") {
        Write-Host "Fila incorrecta, se omite" -ForegroundColor Red
        continue
    }

    $login = ($nombre + "." + $apellido).ToLower()
    $rutaUsuario = "OU=$departamento,OU=Empresa,$dominioDN"

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$login'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name "$nombre $apellido" `
            -GivenName $nombre `
            -Surname $apellido `
            -SamAccountName $login `
            -UserPrincipalName "$login@empresa.local" `
            -Path $rutaUsuario `
            -AccountPassword $password `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Add-ADGroupMember -Identity $departamento -Members $login

        Write-Host "Usuario creado: $login" -ForegroundColor Green
    }
}

Write-Host "Dominio y estructura creados correctamente" -ForegroundColor Cyan

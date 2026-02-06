Import-Module ActiveDirectory

$ServerUNC = "\\192.168.50.10"
$BasePath = "C:\Empresa_users"
$ShareName = "Empresa_users$"
$NetlogonScriptsPath = "C:\Windows\SYSVOL\sysvol\empresa.local\scripts"
$BatName = "carpetas.bat"
$BatPath = Join-Path $NetlogonScriptsPath $BatName
$UsersOU = "OU=Empresa,DC=empresa,DC=local"

if (!(Test-Path $BasePath)) {
    New-Item -ItemType Directory -Path $BasePath | Out-Null
}

if (-not (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name $ShareName -Path $BasePath -FullAccess "Administradores" | Out-Null
}

if (!(Test-Path $NetlogonScriptsPath)) {
    New-Item -ItemType Directory -Path $NetlogonScriptsPath -Force | Out-Null
}

$batContent = 'powershell New-SmbMapping -LocalPath "Y:" -RemotePath "' + $ServerUNC + '\Empresa"'
Set-Content -Path $BatPath -Value $batContent -Encoding ASCII

$users = Get-ADUser -Filter 'Enabled -eq $true' -SearchBase $UsersOU -Properties SamAccountName

foreach ($u in $users) {

    $sam = $u.SamAccountName
    $userFolder = Join-Path $BasePath $sam
    $homeUNC = "$ServerUNC\$ShareName\$sam"

    if (!(Test-Path $userFolder)) {
        New-Item -ItemType Directory -Path $userFolder | Out-Null
    }

    icacls $userFolder /inheritance:r | Out-Null
    icacls $userFolder /grant "${sam}:(OI)(CI)F" | Out-Null

    Set-ADUser -Identity $sam -ScriptPath $BatName -HomeDrive "Z:" -HomeDirectory $homeUNC
}

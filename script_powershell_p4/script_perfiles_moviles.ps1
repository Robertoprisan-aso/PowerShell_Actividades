Import-Module ActiveDirectory

$ServerUNC = "\\192.168.50.10"
$ShareName = "Empresa_users$"
$GroupName = "Personal"

$users = Get-ADGroupMember -Identity $GroupName -Recursive | Where-Object { $_.objectClass -eq "user" }

foreach ($u in $users) {
    $sam = $u.SamAccountName
    $profilePath = "$ServerUNC\$ShareName\$sam"
    Set-ADUser -Identity $sam -ProfilePath $profilePath
}

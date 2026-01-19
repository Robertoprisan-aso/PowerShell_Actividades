do {
    Write-Host ""
    Write-Host "===== MENÚ ====="
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar la fecha y hora actuales"
    Write-Host "x) Salir"
    Write-Host ""

    $opcion = Read-Host "Elige una opción"
    $opcion = $opcion.ToLower()

    switch ($opcion) {

        "a" {
            $nombre = Read-Host "Introduce el nombre de la carpeta"
            New-Item -ItemType Directory -Name $nombre
            Write-Host "Carpeta creada."
        }

        "b" {
            $nombre = Read-Host "Introduce el nombre del fichero"
            New-Item -ItemType File -Name $nombre
            Write-Host "Fichero creado."
        }

        "c" {
            $actual = Read-Host "Nombre actual del fichero o carpeta"
            $nuevo  = Read-Host "Nuevo nombre"
            Rename-Item $actual $nuevo
            Write-Host "Nombre cambiado."
        }

        "d" {
            $nombre = Read-Host "Nombre del archivo o carpeta a borrar"
            Remove-Item $nombre -Recurse -Force
            Write-Host "Elemento borrado."
        }

        "e" {
            $nombre = Read-Host "Nombre del fichero o carpeta"
            if (Test-Path $nombre) {
                Write-Host "EXISTE."
            } else {
                Write-Host "NO existe."
            }
        }

        "f" {
            $dir = Read-Host "Introduce el nombre del directorio"
            if (Test-Path $dir) {
                Get-ChildItem $dir
            } else {
                Write-Host "El directorio no existe."
            }
        }

        "g" {
            Get-Date
        }

        "x" {
            Write-Host "Saliendo del programa..."
        }

        default {
            Write-Host "Opción no válida."
        }
    }

} while ($opcion -ne "x")

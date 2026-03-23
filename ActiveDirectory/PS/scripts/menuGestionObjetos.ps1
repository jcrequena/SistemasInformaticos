#Variables globales
$domain="dc=si,dc=mylocal"
#
#Funciones en la cabecera del script
#

function Show-Menu
{
     param (
           [string]$Titulo = 'Menú principal'
     )
     Clear-Host
     Write-Host "================ $Titulo ================"
    
     Write-Host "1: Opción '1' Crear UOs."
     Write-Host "2: Opción '2' Crear Grupos."
     Write-Host "3: Opción '3' Crear Usuarios."
     Write-Host "Q: Opción 'Q' Salir."
}
function alta_UOs
{
    
}
function alta_grupos
{
     	
     
}
function alta_usuarios
{
  
}


#Primero comprobaremos si se tiene cargado el módulo Active Directory
if (!(Get-Module -Name ActiveDirectory)) #Accederá al then solo si no existe una entrada llamada ActiveDirectory
{
  Import-Module ActiveDirectory #Se carga el módulo
}

#
#MENU PRINCIPAL
#
do
{
     Show-Menu
     $input = Read-Host "Por favor, pulse una opción"
     switch ($input)
     {
           '1' {
                Clear-Host
                alta_UOs
           } '2' {
                Clear-Host
                alta_grupos
           } '3' {
                Clear-Host
                alta_usuarios
           } 'q' {
                'Salimos de la App'
                return
           }
     }
     pause
}
until ($input -eq 'q')

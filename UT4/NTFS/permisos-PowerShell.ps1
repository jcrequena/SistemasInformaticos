#Visualizar los permisos de una carpeta
Get-NTFSAccess -Path ‘C:\Windows’ | Out-GridView

#Añadir permisos
#Añadir los permisos a una carpeta
#Al usuario jcrequena - Control Total
Add-NTFSAccess -Path «D:\Publico» -Account 'orion\jcrequena' -AccessRights FullControl
#Al grupo DepInformatica - Control Total
Add-NTFSAccess -Account 'orion\DepInformatica' -AccessRights FullControl
#A usuario y a grupo - Control Total
Add-NTFSAccess -Account 'orion\DepInformatica','orion\jcrequena' -AccessRights FullControl


#Eliminar permisos
#Para Eliminar los permisos a una carpeta
Remove-NTFSAccess -Path «D:\Publico» -Account 'orion\jcrequena' -AccessRights FullControl

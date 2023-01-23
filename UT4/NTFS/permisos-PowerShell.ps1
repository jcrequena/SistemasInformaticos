#Visualizar los permisos de una carpeta
Get-NTFSAccess -Path ‘C:\Publico’ | Out-GridView

Get-Acl -Path 'C:\Publico' | format-list



#Añadir permisos
#Añadir los permisos a una carpeta
#Al usuario jcrequena - Control Total
Add-NTFSAccess -Path 'D:\Publico' -Account 'orion\jcrequena' -AccessRights FullControl
#Lectura para el usuario jcrequena y grupo DepInformatica
Add-NTFSAccess -Path 'D:\Publico' –Account 'orion\DepInformatica', 'orion\jcrequena' –AccessRights Read




#Al grupo DepInformatica - Control Total
Add-NTFSAccess -Path 'D:\Publico' -Account 'orion\DepInformatica' -AccessRights FullControl
#A usuario y a grupo - Control Total
Add-NTFSAccess -Path 'D:\Publico' -Account 'orion\DepInformatica','orion\jcrequena' -AccessRights FullControl


#Eliminar permisos
#Para Eliminar los permisos a una carpeta
Remove-NTFSAccess -Path «D:\Publico» -Account 'orion\jcrequena' -AccessRights FullControl

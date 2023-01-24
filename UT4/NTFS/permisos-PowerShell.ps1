#Escenario:
  #Nombre del equipo: Cliente-VPN
  #usuario: jcrequena

#Directorio al que modificar los permisos
$PathPublico = "C:\Publico"

#Comprobamos si existe el directorio. Si no existe, lo creamos.
IF (!(test-path $PathPublico))
{
		New-Item -Path $PathPublico -type directory -Force
}
New-Item -Path 'C:\Publico' -ItemType Directory
$acl = Get-ACL -Path 'C:\Publico' 
$ObjectACL = 'Cliente-VPN\jcrequena'
$new = "$ObjectACL","FullControl","ContainerInherit,ObjectInherit","None","Allow"
$accessRule = new-object System.Security.AccessControl.FileSystemAccessRule $new
$acl.SetAccessRule($accessRule)
set-acl -Path C:\Publico -AclObject $acl

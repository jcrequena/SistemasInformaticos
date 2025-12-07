#Creación de usuarios de forma masiva.
#Ayuda: https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1

$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion
  #Añadimos la cuenta de usuario en el grupo de Usuarios del sistema
  Add-LocalGroupMember -Group usuarios -Name $user.cuenta
  Write-Host "Usuario $user.cuenta creado"
}

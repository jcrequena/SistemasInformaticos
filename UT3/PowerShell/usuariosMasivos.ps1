#Creación de usuarios de forma masiva.
$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
  #Añadimos la cuenta de usuario en el grupo de Usuarios del sistema
  Add-LocalGroupMember -Group usuarios -Member $user.cuenta
}

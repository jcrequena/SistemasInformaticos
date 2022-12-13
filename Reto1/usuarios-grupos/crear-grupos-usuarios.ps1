#
# Creación de grupos/departamentos a partir de un csv.
# Ayuda: https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.localaccounts/new-localgroup?view=powershell-5.1
#
$file_groups=Import-Csv -Path departamentos.csv 
foreach ($group in $file_groups) { 
  New-LocalGroup -Name $group.nombre -Description $group.descripcion
}

#
#Creación de usuarios de forma masiva.
#Ayuda: https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1
#

$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.contraseña -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
 
  #
  #Establecemos a falso que la cuenta nunca expire.
  #
  Set-LocalUser $user.cuenta -PasswordNeverExpires $false
  
  #
  #Solicitar cambio de contraseña en el primer inicio de sesión
  #
  net user $user.cuenta /logonpasswordchg:yes
  
  #
  # Añadimos el usuario a los grupos necesarios, para ello,
  # creamos un array con los grupos a los que hay que añadir el usuario y que son
  # Usuarios del sistema y el grupo asociado al departamento donde trabaja
  #
  $grupos-usuario = ("usuarios",$user.departamento)
  foreach ($grupo in $grupos-usuario){
    Add-LocalGroupMember -Group $grupo -Member $user.cuenta
  }
}

REM Comprobamos si existen las carpetas, en caso contrario las creamos

if NOT EXIST C:\Documentación mkdir C:\Documentación
if NOT EXIST C:\Documentación\Dirección mkdir C:\Documentación\Dirección
if NOT EXIST C:\Documentación\Informatica mkdir C:\Documentación\Informatica



REM Se han creado los grupos Direccion_RW e Informatica_RW
REM Se han añadido los usuarios a los grupos
REM Se Aplican las ACLs

net localgroup Direccion_RW /add /comment: "Acceso en modo lectura/escritura a Dirección"
net localgroup Dirección_RW usuario_Direcc /add
icacls C:\Documentación\Dirección /GRANT Dirección_RW:(R,W)

net localgroup Informatica_RW /add /comment: "Acceso en modo lectura/escritura a Informatica"
net localgroup Informatica_RW usuario_Inf /add
icacls C:\Documentación\Informatica /GRANT Informatica_RW:(R,W)

REM Eliminamos la herencia y los permisos asignados al grupo 'Usuarios'

icacls C:\Documentación\Dirección /inheritance:d /T
icacls C:\Documentación\Dirección /remove:g Usuarios

icacls C:\Documentación\Informatica /inheritance:d /T
icacls C:\Documentación\Informatica /remove:g Usuarios

REM Se crean los grupos de lectura de las carpetas (Direccion_R e Informatica_R)
REM Se añaden los usuarios a los grupos.
REM Añadimos el grupo al directorio correspondiente

net localgroup Dirección_R /add /comment: "Acceso en modo lectura a Dirección"
net localgroup Dirección_R usuario_Inf /add
icacls C:\Documentación\Dirección /GRANT Dirección_R:(R)

net localgroup Informatica_R /add /comment: "Acceso en modo lectura a Informatica"
net localgroup Informatica_R usuario_Direc /add
icacls C:\Documentación\Informatica /GRANT Informatica_R:(R)


File_Users_csv="C:\usuarios.csv"

if not exist %File_Users_csv% (goto error) else (goto adduser)

:adduser    
REM La opción /F permite que el for recorra un fichero
REM tokens son las distintas columnas del fichero csv, en este caso, hay 6 campos (columnas)
REM delims=; indica que las columnas se separan por el carácter ;
REM skip=1 indica que la primera línea del fichero no se toma en cuenta. Normalmente, la primera fial
REM son los nombres de los campos.
REM %%a primer campo del fichero (a), el segundo será el b, el tercero el c, etc...
REM in (%File_Users_csv%) fichero que se va a recorrer en el bucle
REM 
FOR /F "tokens=1,2,3,4,5,6 delims=; skip=1" %%a in (%File_Users_csv%) do (
  echo Procesando el usuario con información %%a %%b %%c %%d %%e %%f
)
goto Etiqueta
:error
echo "Error de acceso al fichero"

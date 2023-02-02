@echo off
:: La llamada al script, ha de ser la siguiente:
:: cut.bat fichero_a_leer 
:: donde %1 es el primer parámetro 
:: ejemplo cut.bat fichero_a_leer.txt
:: Para este caso de ejemplo, recuperamos las columnas 1, 5 y 7
::
if "%1"=="" (echo "Falta el primer parámetro. Uso: cut.bat fichero_a_leer" 
	      exit /b
            )

(for /f "tokens=1,5,7 delims=:" %%a in (%1) do echo %%a-%%b-%%c)

:: donde %%a es el valor del campo 1, %%b es el valor del campo 5 y %%c es el valor del campo 7
:: dependiendo del número de tokens(campos) a leer, pondremos tantos caracteres entre %% como campos en orden alfabético
:: es decir:a,b,c,d,e,f,...


::Referencias
::https://gist.github.com/HiroNakamura/4702728

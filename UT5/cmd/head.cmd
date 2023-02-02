::Uso head fichero n-lineas
::En la variable %1 se guarda el 1er parámetro (nombre del fichero) y %2 se guarda el 2º (las líneas a visualizar)
@echo off

setlocal enabledelayedexpansion
::La variable num se utiliza para contar las lineas que se han leído en el bucle for
set num=0
:: El propósito de este FOR, es leer las lineas del fichero que se pasa por parámetro
:: e ir sacando por pantalla las mismas hasta llegar al valor n-lineas (%2 parámetro 2)
for /f "tokens=*" %%h in (%1) do (
    set /a num=!num!+1
    set LIN_!num!=%%h
    echo %%h
    IF !num!==%2 (exit /b)
)

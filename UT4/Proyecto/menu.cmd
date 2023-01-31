@echo off
cls
title Título de la aplicación
echo "Bienvenido %USERNAME%"


::##############
:: MENU GRÁFICO
::##############
:: Cómo hacer un menú
:: https://www.sevenforums.com/tutorials/78083-batch-files-create-menu-execute-commands.html

:menu
cls
echo ++++++++++++++++++++++++++++++++++++++++++++
echo +Programa de ............
echo ++++++++++++++++++++++++++++++++++++++++++++
echo.
echo Selecciona la opcion deseada
echo ----------------------------
echo.
echo 1. Opcion 1
echo 2. Opcion 2
echo 3. Opcion 3
echo 4. Opcion 4
echo S. Salir de la aplicacion.
echo.

:: Aquí creamos el menú de selección.

set /p opcionMenu=Selecciona la opcion (1, 2, 3, 4 o S) y pulsa ENTER:
if %opcionMenu%==1 goto opcion1
if %opcionMenu%==2 goto opcion2
if %opcionMenu%==3 goto opcion3
if %opcionMenu%==4 goto opcion4
if %opcionMenu%==S goto fin
:: Si no se pulsa ninguna de las opciones, volvemos al menú
echo "Pulsa una opcion valida"
pause >null

:: ###########################
:: ZONA DE ETIQUETAS/FUNCIONES
:: ###########################
:opcion4
  ECHO "Has pulsado 4"
  pause >null
  goto menu
:opcion3
  echo "Has pulsado 3"
  pause 
  goto menu
:opcion2
  echo "Has pulsado 2"
  pause >null
  goto menu
:opcion1
  echo "Has pulsado 1"
  pause 
  goto menu
:fin
echo "Nos vamos de la App......."

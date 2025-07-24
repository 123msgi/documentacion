@echo off
setlocal
 
:: Obtener la fecha en formato DD-MM-YYYY
for /f %%i in ('wmic os get localdatetime ^| find "."') do set datetime=%%i
set year=%DATE:~10,4%
set month=%DATE:~4,2%
set day=%DATE:~7,2%
set today=%day%-%month%-%year%
set /p carpetaOrig=CarpetaOrig
if "%carpetaOrig%"=="" ( 
	echo "variable no seteada" 
	set carpetaOrig=%year%\%month%\%day%
) else ( 
	echo "variable seteada" 
)
echo %carpetaOrig%

 
:: Ruta del archivo origen
set origen=D:\VISA CTF Reports\%carpetaOrig%\NP-NovopaymentMXBASE.txt
 
:: Ruta destino con fecha en el nombre
set destino=D:\VISA CTF Reports\2025\06\05\Prueba\NP-NovopaymentMXBASE_%today%.txt
 
:: Copiar el archivo con fecha
copy "%origen%" "%destino%"
 
echo Archivo copiado como: %destino%
pause
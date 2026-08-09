@echo off
setlocal

cd /d C:\Users\Neus-Josep\Desktop\react\culdesac

git add .
git commit -m "Copia automatica"
git push

if %errorlevel% equ 0 (
    powershell 
    -ExecutionPolicy Bypass
    -Command "$wsh = 
    New-Object -ComObject
    WScript.Shell;
    $wsh.Popup('ERROR en la Copia a GitHub ',5,'GitHub - Autopush',16) | Out-Null"
) else (
       powershell 
    -ExecutionPolicy Bypass
    -Command "$wsh = 
    New-Object -ComObject
    WScript.Shell;
    $wsh.Popup('Copia a GitHub completada correctament',3,'GitHub - Autopush',64) | Out-Null"
)
endlocal

rem git diff --cached --quiet
rem if errorlevel 1 (
  rem ---  git commit -m "copia automatica %date% %time%"
  rem ---  echo feta una copia el %date% a les %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
  rem ---  git push

rem --- msg %username% /TIME:5 "Còpia automàtica feta correctament"
rem )
remelse (
rem     echo Llançat autopush.bat, però no feta cap còpia el %date% a les %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
   rem --- msg %username% /TIME:5 "Llançat autopush.bat, però no feta Còpia automàtica "
rem )
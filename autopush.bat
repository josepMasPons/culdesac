@echo off
setlocal

cd /d C:\Users\Neus-Josep\Desktop\react\culdesac

git add .

REM Comprovar si hi ha canvis preparats per fer commit
git diff --cached --quiet

if %errorlevel% equ 0 (
    echo "No hi han canvis "  %date% %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
   REM  echo No hi ha canvis. No es fa cap copia.
) else (
    REM Hi ha canvis: fer commit
    git commit -m "Copia automatica %date% %time%"

    if errorlevel 1 (
         echo "ERROR no feta la copia : "  %date% %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
        REM echo ERROR: no s'ha pogut fer el commit.
        
        powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$wsh = New-Object -ComObject WScript.Shell; $wsh.Popup('ERROR en la copia a GitHub',5,'GitHub - Autopush',16) | Out-Null"
    ) else (
        REM Fer push
        git push

        if errorlevel 1 (
            echo "ERROR el git ha fallat : "  %date% %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
            REM echo ERROR: el git push ha fallat.

            powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$wsh = New-Object -ComObject WScript.Shell; $wsh.Popup('ERROR en la copia a GitHub',5,'GitHub - Autopush',16) | Out-Null"
        ) else (
             echo "COPIA CORRECTA amb data : "  %date% " a les " %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
            REM echo COPIA CORRECTA: git push completat.

            powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$wsh = New-Object -ComObject WScript.Shell; $wsh.Popup('Copia a GitHub completada correctament',3,'GitHub - Autopush',64) | Out-Null"
        )
    )
)

endlocal
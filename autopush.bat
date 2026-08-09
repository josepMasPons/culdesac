@echo off
cd /d C:\Users\Neus-Josep\Desktop\react\culdesac

git add .

git diff --cached --quiet
if errorlevel 1 (
    git commit -m "copia automatica %date% %time%"
    echo feta una copia el %date% a les %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
    git push

    msg %username% /TIME:5 "Còpia automàtica feta correctament"
)
else (
    echo Llançat autopush.bat, però no feta cap còpia el %date% a les %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log
    msg %username% /TIME:5 "Llançat autopush.bat, però no feta Còpia automàtica "
)
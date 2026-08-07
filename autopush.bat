@echo off
cd /d c:\Users\Neus-Josep\Desktop\react\culdesac

git add .

Git diff --cached --quiet
if errorlevel 1 (
git commit -m "copia automatica %date% %time%"
git push  )



@echo off
cd /d c:\Users\Neus-Josep\Desktop\react\culdesac

git add .

Git diff --cached --quiet
if errorlevel 1 (
git commit -m "copia automatica %date% %time%"
git push  )
echo feta una copia copia  el  %date% a les  %time% >> C:\Users\Neus-Josep\Desktop\react\culdesac\autopush.log


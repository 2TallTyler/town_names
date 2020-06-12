@ECHO OFF

ECHO Batch: Running NMLC compiler
%~dp0\nmlc\nmlc -t src\custom_tags.txt -l src\lang --grf new_england_town_names.grf src\new_england_town_names.nml

ECHO Batch: Cleaning up
RMDIR %~dp0\.nmlcache

set /P c=Complete!
if /I "%c%" EQU "TT" (goto :copy
) else (exit)

:copy
ECHO Copying to NewGRF directory
copy /y /v %~dp0\new_england_town_names.grf C:\Users\train\Documents\OpenTTD\newgrf\
pause
exit

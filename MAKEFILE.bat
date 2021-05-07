@ECHO OFF

ECHO Batch: Running NMLC compiler
%~dp0\nmlc\nmlc -l massachusetts\lang --grf massachusetts_town_names.grf massachusetts\massachusetts_town_names.nml
%~dp0\nmlc\nmlc -l colorado\lang --grf colorado_town_names.grf colorado\colorado_town_names.nml
%~dp0\nmlc\nmlc -l north_carolina\lang --grf north_carolina_town_names.grf north_carolina\north_carolina_town_names.nml
%~dp0\nmlc\nmlc -l pennsylvania\lang --grf pennsylvania_town_names.grf pennsylvania\pennsylvania_town_names.nml
%~dp0\nmlc\nmlc -l cuba\lang --grf cuba_town_names.grf cuba\cuba_town_names.nml

ECHO Batch: Cleaning up
RMDIR %~dp0\.nmlcache

set /P c=Complete!
if /I "%c%" EQU "TT" (goto :copy
) else (exit)

:copy
ECHO Copying to NewGRF directory
copy /y /v %~dp0\massachusetts_town_names.grf C:\Users\tyler\Documents\OpenTTD\newgrf\
copy /y /v %~dp0\colorado_town_names.grf C:\Users\tyler\Documents\OpenTTD\newgrf\
copy /y /v %~dp0\north_carolina_town_names.grf C:\Users\tyler\Documents\OpenTTD\newgrf\
copy /y /v %~dp0\pennsylvania_town_names.grf C:\Users\tyler\Documents\OpenTTD\newgrf\
copy /y /v %~dp0\cuba_town_names.grf C:\Users\tyler\Documents\OpenTTD\newgrf\

pause
exit

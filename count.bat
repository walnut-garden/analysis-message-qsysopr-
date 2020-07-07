@echo off
set inputday=%1%
set/a gln=0
set/a gltop=0
set/a glbot=0
set/a glday="06/30/20"
setlocal EnableDelayedExpansion
for /f "tokens=1 delims=:" %%i in ('findstr /n %inputday% a.txt') do (
    set /a mln+=1
    if !mln! equ 1 ( 
      set gltop=%%i
    )
    set glbot=%%i
)
 echo locate %inputday% log:from line %gltop% to line %glbot%

del "%ff%.yky" 2>nul
set /a tbot = %glbot%+1
for /f "usebackq delims=" %%k in ("a.txt") do (
    set /a m+=1
    if !m! geq %gltop% (
    	if !m! leq %tbot% echo %%k>>"%ff%.yky"
    )
)
move "%ff%.yky" "2.txt"
echo.  OUTPUT .... done
pause

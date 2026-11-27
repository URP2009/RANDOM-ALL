@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:menu
cls
echo 1 - Для одного игрока
echo 2 - Для двух игроков
echo 3 - Для трёх игроков
echo 4 - Для четырёх игроков
echo 5 - Для пяти игроков
echo 0 - Выход
echo.
set /p "players_count=Сколько игроков? "

if "%players_count%"=="0" goto :end
if "%players_count%"=="" goto :err
if %players_count% LSS 1 goto :err
if %players_count% GEQ 6 goto :err

set "att_list=GLAZ FUZE IQ BLITZ TWITCH MONTAGNE THERMITE ASH THATCHER SLEDGE BLACKBEARD CAPITAO HIBANA JACKAL YING ZOFIA DOKKAEBI FINKA LION MAVERICK NOMAD GRIDLOCK NOKK AMARU KALI IANA ACE ZERO FLORES OSA SENS GRIM BRAVA RAM DEIMOS STRIKER RAUORA SOLID_SNAKE BUCK"
set "def_list=KAPKAN TACHANKA BANDIT JAGER ROOK DOC PULSE CASTLE SMOKE MUTE FROST VALKYRIE CAVEIRA ECHO MIRA LESION ELA VIGIL ALIBI MAESTRO CLASH KAID MOZZIE WARDEN GOYO WAMAI ORYX MELUSI ARUNI THUNDERBIRD THORN AZAMI SOLIS FENRIR TUBARAO SENTRY SKOPOS DENARI NOOR"

set a_cnt=0
for %%A in (%att_list%) do (
    set "att[!a_cnt!]=%%A"
    set /a a_cnt+=1
)

set d_cnt=0
for %%D in (%def_list%) do (
    set "def[!d_cnt!]=%%D"
    set /a d_cnt+=1
)

for /l %%i in (%a_cnt%,-1,2) do (
    set /a "idx=%%i-1"
    set /a "r=!random! %% %%i"
    for /f "tokens=1,2" %%r in ("!r! !idx!") do (
        set "tmp=!att[%%r]!"
        set "att[%%r]=!att[%%s]!"
        set "att[%%s]=!tmp!"
    )
)

for /l %%i in (%d_cnt%,-1,2) do (
    set /a "idx=%%i-1"
    set /a "r=!random! %% %%i"
    for /f "tokens=1,2" %%r in ("!r! !idx!") do (
        set "tmp=!def[%%r]!"
        set "def[%%r]=!def[%%s]!"
        set "def[%%s]=!tmp!"
    )
)

set /a "max_p=players_count-1"
for /l %%p in (0,1,%max_p%) do (
    set /a "p_num=%%p+1"
    set /a "s=%%p*4"
    set /a "e=s+3"
    set "p_att="
    set "p_def="
    for /l %%k in (!s!,1,!e!) do (
        if defined p_att (
            set "p_att=!p_att!, !att[%%k]!"
            set "p_def=!p_def!, !def[%%k]!"
        ) else (
            set "p_att=!att[%%k]!"
            set "p_def=!def[%%k]!"
        )
    )
    echo =====================================
    echo Для !p_num!-го игрока:
    echo Атака: !p_att!
    echo Защита: !p_def!
)
goto :done

:err
echo Вы завершили рандом или совершили ошибку в выборе

:done
echo.
pause
goto :menu

:end
exit /b

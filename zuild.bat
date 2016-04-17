@echo off
set lP=%~dp0
set lP=%lP:~0,-1%
echo Workspace: %lP%
cd /d %lP%

set VS80COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 8\Common7\Tools\

call "C:\Program Files (x86)\Microsoft Visual Studio 8\VC\vcvarsall.bat" x86

REM To help cl.exe find "windows.h"
rem set INCLUDE=C:\Program Files (x86)\Windows Kits\10\Include\10.0.10146.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10146.0\shared;%INCLUDE%

REM To help link.exe find "uuid.lib"
rem set LIB=C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10146.0\um\%Platform%;%LIB%

set
rem nmake

rem cl.exe /c /DWIN32 /D_DEBUG /D_WINDOWS /DUNICODE Player.cpp /Fobin\
rem rc.exe /fo bin/BasicPlayback.res BasicPlayback.rc
REM [release version] link.exe /subsystem:Windows /debug /out:bin\MF_BasicPlayback.exe bin\Player.obj bin\TopoBuilder.obj bin\winmain.obj bin\winmain.obj bin\BasicPlayback.res mf.lib mfplat.lib mfuuid.lib strmiids.lib shlwapi.lib
REM [debug version] link.exe /subsystem:Windows /debug /out:bin\MF_BasicPlayback.exe bin\Player.obj bin\TopoBuilder.obj bin\winmain.obj bin\winmain.obj bin\BasicPlayback.res mf.lib mfplat.lib mfuuid.lib strmiids.lib shlwapi.lib msvcmrtd.lib msvcrtd.lib 
rem link.exe /subsystem:Windows /debug /out:bin\MF_BasicPlayback.exe bin\Player.obj bin\TopoBuilder.obj bin\winmain.obj bin\winmain.obj bin\BasicPlayback.res mf.lib mfplat.lib mfuuid.lib strmiids.lib shlwapi.lib comdlg32.lib msvcmrtd.lib msvcrtd.lib

bison.exe -d calc.y
flex.exe calc.l
cl.exe /c /D_DEBUG lex.yy.c /Fobin\
cl.exe /c /D_DEBUG calc.tab.c /Fobin\
link.exe /subsystem:Console /debug /out:bin\calc.exe bin\calc.tab.obj bin\lex.yy.obj msvcmrtd.lib msvcrtd.lib

bin\calc.exe < in.txt

pause

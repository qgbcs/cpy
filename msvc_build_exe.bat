REM Error "fatal error C1034: windows.h: no include path set"

REM "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"


@REM /link 参数要放最后
"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\bin\HostX86\x64\cl.exe" /MT -IC:/QGB/Anaconda3/include  /Tcfputsmodule.c /link /LIBPATH:"C:/QGB/Anaconda3/libs"

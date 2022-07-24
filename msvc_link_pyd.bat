 REM /LIBPATH:C:\QGB\Anaconda3\PCbuild\amd64
REM set py_libpath=C:\QGB\Anaconda3\libs
REM set pyv=37

IF NOT DEFINED py_libpath (set py_libpath=C:\QGB\miniforge3\libs)
IF NOT DEFINED pyv (set pyv=39)



mkdir build\lib.win-amd64-%pyv%\


"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\bin\HostX86\x64\link.exe" /nologo /INCREMENTAL:NO /LTCG /nodefaultlib:libucrt.lib ucrt.lib /DLL /MANIFEST:EMBED,ID=2 /MANIFESTUAC:NO /LIBPATH:%py_libpath% "/LIBPATH:C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\ATLMFC\lib\x64" "/LIBPATH:C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\lib\x64" "/LIBPATH:C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\lib\um\x64" "/LIBPATH:C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\ucrt\x64" "/LIBPATH:C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\um\x64" /EXPORT:PyInit_fputs build\temp.win-amd64-%pyv%\Release\fputsmodule.obj /OUT:build\lib.win-amd64-%pyv%\fputs.cp%pyv%-win_amd64.pyd /IMPLIB:build\temp.win-amd64-%pyv%\Release\fputs.cp%pyv%-win_amd64.lib

@REM create:
REM C:\test\github\cpy_fputs\build\temp.win-amd64-3.7\Release\fputs.cp37-win_amd64.exp
REM C:\test\github\cpy_fputs\build\lib.win-amd64-3.7\fputs.cp37-win_amd64.pyd

@REM
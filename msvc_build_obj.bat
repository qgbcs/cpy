IF NOT DEFINED py_include (set py_include=C:\QGB\miniforge3\include)
IF NOT DEFINED pyv (set pyv=39)

REM mkdir 只能用 \ 不能用 / ，否则无法创建并且没有报错
mkdir build\temp.win-amd64-%pyv%
mkdir build\temp.win-amd64-%pyv%\Release

"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\bin\HostX86\x64\cl.exe" /c /nologo /Ox /W3 /GL /DNDEBUG /MT -I%py_include% "-IC:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\ATLMFC\include" "-IC:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.28.29910\include" "-IC:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\include\um" "-IC:\Program Files (x86)\Windows Kits\10\include\10.0.19041.0\ucrt" "-IC:\Program Files (x86)\Windows Kits\10\include\10.0.19041.0\shared" "-IC:\Program Files (x86)\Windows Kits\10\include\10.0.19041.0\um" "-IC:\Program Files (x86)\Windows Kits\10\include\10.0.19041.0\winrt" "-IC:\Program Files (x86)\Windows Kits\10\include\10.0.19041.0\cppwinrt" /Fobuild/temp.win-amd64-%pyv%/Release/fputsmodule.obj /Tcfputsmodule.c

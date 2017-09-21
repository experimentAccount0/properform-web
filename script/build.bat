@ECHO OFF
SET CLOSURE=%~dp0\..\closure
SET TSPATH=%~dp0\..\website\ts
SET JSPATH=%~dp0\..\website\js
SET DEBUG=True

FOR /R %TSPATH% %%i IN (*.ts) DO (
	CALL tsc --outDir %JSPATH% --rootDir %TSPATH% %%i
)

CD %JSPATH%
IF defined DEBUG (
	CALL python -B %CLOSURE%\lib\closure\bin\build\depswriter.py --root_with_prefix=". ../js" > ..\goog\deps.js
) ELSE (
	ECHO No release build!
)

PAUSE

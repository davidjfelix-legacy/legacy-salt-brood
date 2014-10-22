REM bootstrap curl so I can actually work with a proxy and still sleep at night
set logfile=%temp%\brood\bootstrap.log

REM set version numbers here
set curl_version=7.38.0

REM set actual file names here
set curl=curl-%curl_version%-win64.msi

REM set up the env
md %temp%\brood
call:log Bootstrap curl initializing

REM download and install the bootstrapped executables
call:logexec cmd.exe /c PowerShell (New-Object System.Net.WebClient).DownloadFile('http://www.confusedbycode.com/curl/%curl%', '%temp%\brood\%curl%');
call:logexec msiexec /qn /i %temp%\brood\%curl%

goto :EOF

:logexec
SET _pcmd=%*
echo %date% %time% - Executing: %_pcmd% >> %logfile%
%_pcmd% >> %logfile% 2>&1
echo %date% %time% - ReturnCode: %ErrorLevel% >> %logfile%
goto :EOF

:log
echo %date% %time% - Status: %* >> %logfile%
goto: EOF

:EOF

set logfile=%temp%\brood\bootstrap.log

REM set version numbers here
set puppet_version=3.7.1

REM set actual file names here
set puppet=puppet-%puppet_version%-x64.msi 

REM set up the env
md %temp%\brood
call:log Bootstrap initializing

REM download and install the bootstrapped executables
call:logexec cmd.exe /c PowerShell (New-Object System.Net.WebClient).DownloadFile('https://downloads.puppetlabs.com/windows/%puppet%', '%temp%\brood\%puppet%');
call:logexec msiexec /qn /i %temp%\brood\%puppet%

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

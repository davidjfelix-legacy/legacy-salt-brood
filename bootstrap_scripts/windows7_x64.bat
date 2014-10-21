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

:EOF

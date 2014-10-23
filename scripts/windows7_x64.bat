set logfile=%temp%\brood\bootstrap.log

REM set version numbers here
set puppet_version=3.7.1

REM set repo URLS here
set puppet_repo=https://downloads.puppetlabs.com/windows/
set github_repo=https://raw.githubusercontent.com/hatchery/

REM set actual file names here
set puppet=puppet-%puppet_version%-x64.msi 
set git=dna-git
set ruby=dna-ruby
set librarian=dna-librarian-puppet


REM set up the env
md %temp%\brood
call:log Bootstrap initializing

REM download and install the bootstrapped executables
if defined https_proxy (
  call:logexec cmd.exe /c curl -x %https_proxy% -L %puppet_repo%%puppet% -o %temp%\brood\%puppet%
  call:logexec cmd.exe /c curl -x %https_proxy% -L %github_repo%%git%/master/manifests/bootstrap.pp -o %temp%\brood\%git%.pp
  call:logexec cmd.exe /c curl -x %https_proxy% -L %github_repo%%ruby%/master/manifests/bootstrap.pp -o %temp%\brood\%ruby%.pp
  call:logexec cmd.exe /c curl -x %https_proxy% -L %github_repo%%librarian%/master/manifests/bootstrap.pp -o %temp%\brood\%librarian%.pp
) else (
  call logexec cmd.exe /c curl -L %puppet_repo%%puppet% -o %temp%\brood\%puppet%
  call:logexec cmd.exe /c curl -L %github_repo%%git%/master/manifests/bootstrap.pp -o %temp%\brood\%git%.pp
  call:logexec cmd.exe /c curl -L %github_repo%%ruby%/master/manifests/bootstrap.pp -o %temp%\brood\%ruby%.pp
  call:logexec cmd.exe /c curl -L %github_repo%%librarian%/master/manifests/bootstrap.pp -o %temp%\brood\%librarian%.pp
)
call:logexec msiexec /qn /i %temp%\brood\%puppet%
REM FIXME: should execute puppet installation of packages here

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

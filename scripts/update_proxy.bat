REM warn user that their password is going into a plaintext variable
echo !!!!WARNING YOU ARE ABOUT TO STORE YOUR PASSWORD IN PLAINTEXT!!!!
echo * This is likely already happening on the system.
echo * I'm warning you because I know it's not the best idea.
echo * The usability is probably worth the risk.
echo * If you don't do it here, you'll be typing it out a lot.
echo * It's going to be visible on screen every time you type it.
echo
set /p username=Enter your username: 
set /p password=Enter your password: 
set /p http=Enter the HTTP proxy address (with http:// prefix if needed): 
set /p https=Enter the HTTPS proxy address (with http:// or https:// prefix if needed): 
set /p httpport=Enter the HTTP proxy port: 
set /p httpsport=Enter the HTTPS proxy port:
set /p failsafe=Now is your last chance to exit. Hit enter to continue...
setx http_proxy=%username%:%password%@%http%:%httpport% /m
setx https_proxy=%username%:%password%@https%:%httpsport% /m
cls
echo HTTP and HTTPS proxy variables have been set. You can close this...

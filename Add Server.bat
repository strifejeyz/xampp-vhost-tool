@echo off

REM Define the output file path for httpd-vhosts.conf
set "output_file=C:\Xampp\apache\conf\extra\httpd-vhosts.conf"

REM Define the output file path for windows_hosts
set "windows_hosts=C:\WINDOWS\System32\drivers\etc\hosts"

REM Prompting user to enter project directory
set /p project_directory="Enter project directory path: "

REM Prompting user to enter server name
set /p server_name="Enter server name: "

REM Appending text to httpd-vhosts.conf file without double quotes
(
  echo.
  echo ^<VirtualHost *:80^>
  echo   DocumentRoot "%project_directory%"
  echo   ServerName %server_name%
  echo ^</VirtualHost^>
) >> "%output_file%"

REM Writing server_name to windows_hosts file
echo 127.0.0.1 %server_name% >> "%windows_hosts%"

echo Virtual Host added successfully.
pause
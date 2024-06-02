@echo off
title System Information and Diagnostics
echo ============================
echo   System Information Report
echo ============================
echo.

:: Get OS version and build number
echo OS Version and Build:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
echo.

:: Get system manufacturer and model
echo System Manufacturer and Model:
systeminfo | findstr /B /C:"System Manufacturer" /C:"System Model"
echo.

:: Get BIOS version
echo BIOS Version:
wmic bios get smbiosbiosversion
echo.

:: Get processor information
echo Processor Information:
wmic cpu get name, NumberOfCores, NumberOfLogicalProcessors
echo.

:: Get memory (RAM) information
echo Installed Memory (RAM):
wmic memorychip get capacity, speed, manufacturer
echo.

:: Get disk information
echo Disk Drives Information:
wmic diskdrive get model, size, status
echo.

:: Get network configuration
echo Network Configuration:
ipconfig /all
echo.

:: Get list of installed programs
echo Installed Programs:
wmic product get name, version
echo.

:: Get running processes
echo Running Processes:
tasklist
echo.

:: Get services information
echo Services Information:
net start
echo.

:: Get startup programs
echo Startup Programs:
wmic startup get caption, command
echo.

:: Get event logs (last 10 application errors)
echo Last 10 Application Errors in Event Log:
wevtutil qe Application /f:text /rd:true /c:10 /q:"*[System[Provider[@Name='Application Error']]]"
echo.

:: Get system uptime
echo System Uptime:
wmic os get lastbootuptime
echo.

echo ============================
echo     End of Report
echo ============================
pause

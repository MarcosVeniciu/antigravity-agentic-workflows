@echo off
setlocal
chcp 65001 >nul

echo Starting Antigravity Agentic Workflows installer...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1" %*

set EXITCODE=%errorlevel%
if %EXITCODE% neq 0 (
    echo.
    echo [ERROR] The installer exited with error (code %EXITCODE%).
    pause
) else (
    echo %cmdcmdline% | find /i "%~0" >nul
    if not errorlevel 1 pause
)
exit /b %EXITCODE%

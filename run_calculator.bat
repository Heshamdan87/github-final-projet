@echo off
echo ================================================
echo     Simple Interest Calculator Launcher
echo ================================================
echo.
echo Choose an option:
echo 1. Run Python Calculator (Interactive)
echo 2. Run Tests
echo 3. Open Web Calculator
echo 4. Exit
echo.
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo Starting Python Calculator...
    python simple_interest_calculator.py
) else if "%choice%"=="2" (
    echo.
    echo Running Tests...
    python test_calculator.py
    pause
) else if "%choice%"=="3" (
    echo.
    echo Opening Web Calculator...
    start simple_interest_calculator.html
) else if "%choice%"=="4" (
    echo.
    echo Goodbye!
    exit
) else (
    echo.
    echo Invalid choice. Please try again.
    pause
    goto start
)

:start
echo.
pause

@echo off
    setlocal enableextensions enabledelayedexpansion
    set /a "x = 0"

:more_to_process
    if %x% leq 5 (
        echo %x%
        set /a "x = x + 1"
        goto :more_to_process
    )

    endlocal
@echo off
REM First Batch Script is from here ==>
REM https://stackoverflow.com/questions/37338476/how-to-get-the-percentage-of-memory-utilization-using-wmic-in-batch-script?answertab=active#tab-top
Title Batch Script to get CPU %% and MEM %% Usage

setlocal

set "CpuUsage=0"
set "Processors=0"
%SystemRoot%\System32\wbem\wmic.exe CPU get loadpercentage >"%TEMP%\cpu_usage.tmp"
for /F "skip=1" %%P in ('type "%TEMP%\cpu_usage.tmp"') do (
    set /A CpuUsage+=%%P
    set /A Processors+=1
)
del "%TEMP%\cpu_usage.tmp"

rem Calculate the CPU usage as percentage value of all processors.
set /A CpuUsage/=Processors
goto GetTotalMemory

:GetTotalMemory
for /F "skip=1" %%M in ('%SystemRoot%\System32\wbem\wmic.exe ComputerSystem get TotalPhysicalMemory') do set "TotalMemory=%%M" & goto GetAvailableMemory
:GetAvailableMemory
for /F "skip=1" %%M in ('%SystemRoot%\System32\wbem\wmic.exe OS get FreePhysicalMemory') do set "AvailableMemory=%%M" & goto ProcessValues

:ProcessValues
set "TotalMemory=%TotalMemory:~0,-6%"
set /A TotalMemory+=50
set /A TotalMemory/=1073

set /A TotalMemory*=1024

set /A AvailableMemory/=1024

set /A UsedMemory=TotalMemory - AvailableMemory

set /A UsedPercent=(UsedMemory * 100) / TotalMemory

if "%Processors%" == "1" (
    set "ProcessorInfo="
) else (
    set "ProcessorInfo= of %Processors% processors"
)
echo(
echo(   CPU percentage :  %CpuUsage% %%%ProcessorInfo%
echo(   Free memory    :  %AvailableMemory% MB
echo(   Total memory   :  %TotalMemory% MB
echo(   Used memory    :  %UsedMemory% MB
echo(   Memory usage   :  %UsedPercent% %%


@echo off

set build="vs2019"

if not [%1]==[] set build=%1

vendor\premake\bin\premake5.exe "%build%"
PAUSE
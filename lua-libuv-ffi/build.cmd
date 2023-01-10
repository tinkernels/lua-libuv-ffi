@echo off
chcp 65001 >NUL 2>NUL

cmd /c %~dp0build-win32.cmd
cmd /c %~dp0build-winx64.cmd

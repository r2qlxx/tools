@echo off
powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process notepad 'C:\Windows\System32\drivers\etc\hosts' -Verb RunAs"
@echo off
@if "%1"=="" goto help
@if "%2"=="" goto help
@if "%3"=="" goto help

@echo Global Start > shellcode.asm
@echo SECTION 'foo' write, execute,read >> shellcode.asm
@echo Start:       >> shellcode.asm
@echo incbin "%2"  >> shellcode.asm
@yasm.exe -f win%1 -o shellcode.obj shellcode.asm
@golink /ni /fo %3 /entry Start shellcode.obj
@del shellcode.asm
@del shellcode.obj
@dir %3*

@goto exit

@:help
@echo Converts a shellcode blob to an executable
@echo Required Arguments:
@echo - architecture: 32 or 64 (depending on the shellcode)
@echo - shellcode blob file name
@echo - Output executable file name
@:exit
echo.
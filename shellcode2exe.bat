@echo off
@if "%1"=="" goto help

@echo Global Start > shellcode.asm
@echo SECTION 'foo' write, execute,read >> shellcode.asm
@echo Start:       >> shellcode.asm
@echo incbin "%2"  >> shellcode.asm
@yasm.exe -f win%1 -o shellcode.obj shellcode.asm
@golink /ni /entry Start shellcode.obj
@del shellcode.asm
@del shellcode.obj
@dir shellcode.exe

@goto exit

@:help
@echo Converts a shellcode blob to an executable
@echo Required Arguments:
@echo - architecture: 32 or 64 (depending on the shellcode)
@echo - shellcode blob file name

@:exit
echo.
# shellcode2exe

Compile a binary shellcode blob into an exe file

As a malware researcher I do this mostly for shellcode debugging. 
Some researchers use "shellcode_launcher", but it's easier to convert the shellcode to exe because
it allows doing both static and dynamic analysis in IDA Pro.

The executable is created in 2 steps:
1) An assembly source file is created with an "incbin" directive
2) The assembly file is assembled with yasm into a .obj file
3) The .obj file is linked into a .exe file
4) The .obj and .asm files are removed

```batch
Required Arguments:
- architecture: 32 or 64 (depending on the shellcode)
- shellcode blob file name
- Output executable file name
```

# shellcode2exe

Compile a binary shellcode blob into an exe file

As a malware researcher I do this mostly for shellcode debugging. 
Some researchers use "shellcode_launcher", but it's easier to convert the shellcode to exe because
it allows doing both static and dynamic analysis in IDA Pro.

```batch
Required Arguments:
- architecture: 32 or 64 (depending on the shellcode)
- shellcode blob file name
- Output executable file name
```

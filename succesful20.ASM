format PE GUI 4.0
entry start

include 'D:\FASM\INCLUDE\win32a.inc'

section '.idata' import data readable writeable
    library kernel32, 'kernel32.dll', user32, 'user32.dll'
    import kernel32, ExitProcess, 'ExitProcess'
    import user32, MessageBoxA, 'MessageBoxA', wsprintfA, 'wsprintfA'

section '.data' data readable writeable
    Caption db "?????????",0
    Text db "y = %d",0
    buf db 256 dup(0)  
    a dd 2

section '.code' code readable executable
start:
    mov eax, [a]
    imul eax, eax
    imul eax, [a]      ; a^3
    add eax, 5         ; a^3 + 5

    mov ebx, [a]
    imul ebx, 8        ; 8a

    cdq
    idiv ebx           ; eax = (a^3 + 5) / 8a

    ; ????? wsprintfA
    sub esp, 16        ; ???????? ????? ? ?????
    push eax
    push Text
    push buf
    call [wsprintfA]  
    add esp, 16        ; ??????? ????

    ; ????? MessageBoxA
    push 0
    push Caption
    push buf
    push 0
    call [MessageBoxA]
    add esp, 16        ; ??????? ????

    ; ?????????? ?????????
    push 0
    call [ExitProcess]

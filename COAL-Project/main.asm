; TITLE Project Name
; Authors: Sufiyaan Usmani (21K-3195), Yousuf Ahmed (21K-4594), Qasim Hasan(21K-3210)
; Project Link: https://github.com/sufiyaanusmani/COAL-Project

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

includelib D:\Irvine\Kernel32.Lib
includelib D:\Irvine\User32.Lib
includelib D:\Irvine\Irvine32.lib
include     D:\Irvine\kernel32.inc
include D:\Irvine\Irvine32.inc
include D:\Irvine\Macros.inc

;include D:\Irvine\Irvine32.inc

.data
    row BYTE 0
    col BYTE 0
    ascii BYTE ?
    ebxValue DWORD ?
    validFlag BYTE 0
    appA db "C:\Program Files (x86)\Dev-Cpp\devcpp.exe", 0
    beep1 db "C:\Users\Sufyan\Downloads\nircmd.exe beep 1000 500",0
    appG db "C:\Program Files\Google\Chrome\Application\chrome.exe",0
    appC db "C:\Windows\System32\calc.exe",0
    appP db "C:\Program Files\PuTTY\putty.exe",0
    appS db "C:\Windows\System32\SnippingTool.exe",0
    appV db "C:\Users\Sufyan\AppData\Local\Programs\Microsoft VS Code\Code.exe",0
    appX db "D:\calc.exe",0
    appW db "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE",0
    volUp db "C:\Users\Sufyan\Downloads\nircmd.exe changesysvolume 2000",0
    volDown db "C:\Users\Sufyan\Downloads\nircmd.exe changesysvolume -2000",0
    desktop db "C:\Users\Sufyan\Downloads\nircmd.exe win show class progman",0
    mute db "C:\Users\Sufyan\Downloads\nircmd.exe mutesysvolume 1",0
    unmute db "C:\Users\Sufyan\Downloads\nircmd.exe mutesysvolume 0",0
    incBrightness db "C:\Users\Sufyan\Downloads\nircmd.exe changebrightness 10 10",0
    decBrightness db "C:\Users\Sufyan\Downloads\nircmd.exe changebrightness -10 -10",0
.code
    main PROC
        call clearAll
        call crlf
    L::
        mov validFlag, 0
        call getKey
        call isValid
        movzx eax, validFlag
        cmp eax, 1
        jnz L
        call openApp
    jmp L
		Invoke ExitProcess,0
    main ENDP


    clearAll PROC
        ; -------------------------------------------------------- -
        ; Name: clearAll
        ; Description: clears all registers
        ; Receives: void
        ; Returns: void
        ; -------------------------------------------------------- -
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        ; we can also clear esi and edi

        ret
    clearAll ENDP


    jump PROC
        ; -------------------------------------------------------- -
        ; Name: jump
        ; Description: to move to specific coordinate in console
        ; Receives: col, row
        ; Returns: void
        ; -------------------------------------------------------- -
        mov dl, col
        mov dh, row
        call gotoxy

        ret
    jump ENDP


    getKey PROC
        ; -------------------------------------------------------- -
        ; Name: getKey
        ; Description: Reads the key input by user
        ; Receives: 
        ; Returns: ebxValue, ascii
        ; -------------------------------------------------------- -
        L1:
            mov  eax, 50
            call Delay

            call ReadKey
            jz   L1
            ;mShow  al, h
            ;mShow  ah, h
            ;mShow  dx, h
            ;mShow  ebx, hnn
            mov ascii, al
            mov ebxValue, ebx

            ; cmp    dx, VK_ESCAPE
            ; jne    L1
        ret
    getKey ENDP


    isValid PROC
        ; -------------------------------------------------------- -
        ; Name: isValid
        ; Description: compares if value is in correct range
        ; Receives: ascii, ebxValue
        ; Returns: validFlag
        ; -------------------------------------------------------- -
        PUSH eax
        movzx eax, ascii
        cmp eax, 60h
        jng invalid
        movzx eax, ascii
        cmp eax, 7Bh
        jnl invalid
        mov eax, ebxValue
        cmp eax, 22h
        jnz invalid
        mov validFlag, 1

        invalid:
            POP eax
        ret
    isValid ENDP

    openApp PROC
        mov eax, 0
        A:
            mov al, ascii
            cmp al, 61h
            jnz B
            mWriteLn "A",0
            push OFFSET appA
            call WinExec
            jmp L
        B:
            mov al, ascii
            cmp al, 62h
            jnz C1
            mWriteLn "B",0
            push OFFSET beep1
            call WinExec
            jmp L
        C1:
            mov al, ascii
            cmp al, 63h
            jnz D
            mWriteLn "C",0
            push OFFSET appC
            call WinExec
            jmp L
        D:
            mov al, ascii
            cmp al, 64h
            jnz E
            mWriteLn "D",0
            push OFFSET volDown
            call WinExec
            jmp L
        E:
            mov al, ascii
            cmp al, 65h
            jnz F
            mWriteLn "E",0
            ;push OFFSET appE
            jmp ex
        F:
            mov al, ascii
            cmp al, 66h
            jnz G
            mWriteLn "F",0
            ;push OFFSET appF
            jmp ex
        G:
            mov al, ascii
            cmp al, 67h
            jnz H
            mWriteLn "G",0
            push OFFSET appG
            call WinExec
            jmp L
        H:
            mov al, ascii
            cmp al, 68h
            jnz I
            mWriteLn "H",0
            ;push OFFSET appH
            jmp ex
        I:
            mov al, ascii
            cmp al, 69h
            jnz J
            mWriteLn "I",0
            ;push OFFSET appI
            jmp ex
        J:
            mov al, ascii
            cmp al, 6Ah
            jnz K
            mWriteLn "J",0
            ;push OFFSET appJ
            jmp ex
        K:
            mov al, ascii
            cmp al, 6Bh
            jnz L1
            mWriteLn "K",0
            ;push OFFSET appK
            jmp ex
        L1:
            mov al, ascii
            cmp al, 6Ch
            jnz M
            mWriteLn "L",0
            ;push OFFSET appL
            jmp ex
        M:
            mov al, ascii
            cmp al, 6Dh
            jnz N
            mWriteLn "M",0
            push OFFSET mute
            call WinExec
            jmp L
        N:
            mov al, ascii
            cmp al, 6Eh
            jnz O
            mWriteLn "N",0
            push OFFSET unmute
            call WinExec
            jmp L
        O:
            mov al, ascii
            cmp al, 6Fh
            jnz P
            mWriteLn "O",0
            ;push OFFSET appO
            jmp ex
        P:
            mov al, ascii
            cmp al, 70h
            jnz Q
            mWriteLn "P",0
            push OFFSET appP
            call WinExec
            jmp L
        Q:
            mov al, ascii
            cmp al, 71h
            jnz R
            mWriteLn "Q",0
            ;push OFFSET volUp
            ;call WinExec
            jmp ex
        R:
            mov al, ascii
            cmp al, 72h
            jnz S
            mWriteLn "R",0
            ;push OFFSET appR
            jmp ex
        S:
            mov al, ascii
            cmp al, 73h
            jnz T
            mWriteLn "S",0
            push OFFSET appS
            call WinExec
            jmp L
        T:
            mov al, ascii
            cmp al, 74h
            jnz U
            mWriteLn "T",0
            ;push OFFSET appT
            jmp ex
        U:
            mov al, ascii
            cmp al, 75h
            jnz V
            mWriteLn "U",0
            push OFFSET volUp
            call WinExec
            jmp L
        V:
            mov al, ascii
            cmp al, 76h
            jnz W
            mWriteLn "V",0
            push OFFSET appV
            call WinExec
            jmp L
        W:
            mov al, ascii
            cmp al, 77h
            jnz X
            mWriteLn "W",0
            push OFFSET appW
            call WinExec
            jmp L
        X:
            mov al, ascii
            cmp al, 78h
            jnz Y
            mWriteLn "X",0
            push OFFSET incBrightness
            call WinExec
            jmp L
        Y:
            mov al, ascii
            cmp al, 79h
            jnz Z
            mWriteLn "Y",0
            ;push OFFSET appY
            jmp ex
        Z:
            mov al, ascii
            cmp al, 7Ah
            mWriteLn "Z",0
            push OFFSET decBrightness
            call WinExec
            jmp L
        ex:
        
        ret
    openApp ENDP
END main
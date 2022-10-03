TITLE Project Name
; Authors: Sufiyaan Usmani (21K-3195), Yousuf Ahmed (21K-4594), Qasim Hasan(21K-3210)
; Project Link: https://github.com/sufiyaanusmani/COAL-Project

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
    row BYTE 0
    col BYTE 0
    ascii BYTE ?
    ebxValue DWORD ?

.code
    main PROC
        call clearAll
        mWriteLn "  ASCII     Virtual-scan  Virtual-key   Keyboard flags"
        call crlf
        call getKey
        
		exit
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

            mShow  al, h
            mShow  ah, h
            mShow  dx, h
            mShow  ebx, hnn
            mov ascii, al
            mov ebxValue, ebx

            ; cmp    dx, VK_ESCAPE
            ; jne    L1
        ret
    getKey ENDP

END main
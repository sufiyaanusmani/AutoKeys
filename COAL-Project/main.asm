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
    validFlag BYTE 0

.code
    main PROC
        call clearAll
        mWriteLn "  ASCII     Virtual-scan  Virtual-key   Keyboard flags"
        call crlf
    L:
        call getKey
        call isValid
        movzx eax, validFlag
        call WriteInt
    jmp L
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


    isValid PROC
        ; -------------------------------------------------------- -
        ; Name: isValid
        ; Description: compares if value is in correct range
        ; Receives: ascii, ebxValue
        ; Returns: validFlag
        ; -------------------------------------------------------- -
        PUSH eax
        movzx eax, ascii
        cmp eax, 61h
        jnae invalid
        movzx eax, ascii
        jnbe invalid
        mov eax, ebxValue
        cmp eax, 22h
        jnz invalid
        mov validFlag, 1

        invalid:
            POP eax
        ret
    isValid ENDP
END main
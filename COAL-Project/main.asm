TITLE Project Name
; Authors: Sufiyaan Usmani (21K-3195), Yousuf Ahmed (21K-4594), Qasim Hasan(21K-3210)
; Project Link: https://github.com/sufiyaanusmani/COAL-Project

INCLUDE Irvine32.inc

.data

.code
    main PROC
        call clearAll
		exit
    main ENDP

    clearAll PROC
        ; This procedure will clear following registers: eax, ebx, ecx, edx
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        ; we can also clear esi and edi

        ret
    clearAll ENDP

END main
include Irvine32.inc
.data
    max dword ?
.code
main proc
    mov ebx,1
    call readint
    mov max,eax
cycle:
    call readint 
    inc ebx
    cmp ebx,2
    ja final
    cmp max,eax
    ja cycle
    mov max,eax
    jmp cycle

final:
    call writeint
    exit

main endp
end main
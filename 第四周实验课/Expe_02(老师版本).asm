include irvine32.inc
.data 


.code 
main proc 


again:
    cmp ecx,4
    ja final
    call findPnumber
    inc ecx
    jmp again
final:
    exit
main endp

findPnumber proc
    ;参数：edx，返回值：eax
again: 
    call isPnumber;返回值eax为1或者0
    cmp eax,1
    jz final
    inc edx
    jmp again

final:
    mov eax,edx
    ret
findPnumber endp

isPnumber proc
    ;参数edx 返回值eax
    mov ebx,1;ebx存edx因数的部分和
    mov esi,2;esi是潜在的因数
again:
    cmp esi,edx
    jae final
    push edx
    mov eax,edx
    mov edx,0
    div esi
    cmp edx,0
    jnz next
    add ebx,esi
next:
    pop edx
    inc esi
    jmp again

final:
    cmp ebx,edx
    jz final1
    mov eax,

    
    ret

isPnumber endp















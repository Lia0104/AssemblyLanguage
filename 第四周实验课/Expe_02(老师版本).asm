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
    ;������edx������ֵ��eax
again: 
    call isPnumber;����ֵeaxΪ1����0
    cmp eax,1
    jz final
    inc edx
    jmp again

final:
    mov eax,edx
    ret
findPnumber endp

isPnumber proc
    ;����edx ����ֵeax
    mov ebx,1;ebx��edx�����Ĳ��ֺ�
    mov esi,2;esi��Ǳ�ڵ�����
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















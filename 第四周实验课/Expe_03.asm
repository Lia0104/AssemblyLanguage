;���ʵ���������������ֽ�

include Irvine32.inc
.data
    num dd ?
    i dd 1
.code

main proc

    call readint
    ; mov num,eax

again1:   ;���ѭ��
    inc i ;ÿ��ѭ��iҪ+1;i��ʼֵΪ2
    cmp i,eax;i>num �ͽ�������ע��i==eax��Ҫ����ִ�У����ܽ���
    ja final

again2:
    push eax
    mov edx,0
    div i
    pop eax
    cmp edx,0
    je print;������Ϊ0���������
    jmp again1;������Ϊ0������again1��i+1


print:
    push eax
    mov eax,i
    call writeDec
    call crlf
    pop eax
    div i
    jmp again2
    
final:
    exit

main endp

end main

;�ҳ��ĸ�������

include Irvine32.inc
.data
    tot dd 0
    cnt dd 0;��¼��ǰ�������ĸ���
    a dd 0
    num dd 0;��ǰ���Ե�ֵ
    cur_num dd ?

.code
main proc

again:
    cmp cnt,4
    jae final;�����ľ�ֹͣ
    inc num;��1��ʼ
    mov ebx,num
    call perfetNum;����Ϊebx,����ֵeax
    cmp eax,num
    je output;��Ⱦ����
    jmp again;���Ⱦͼ���ѭ��

output:
    inc cnt
    call writeDec
    call crlf
    jmp again

final:
    exit
main endp

perfetNum proc
    ;����ebx
    ;a��ǰ�����ǲ���������ֵ
    mov a,0
    mov ecx,0;ecx �ܵ�������������ֵ
    mov cur_num,ebx
again:
    inc a;��������1��ʼ
    cmp a,ebx
    jae final;
    mov edx,0;edx ����   ;����һ��Ҫ�õ�edx
    mov eax,cur_num;ÿ�ζ�Ҫ��cur_num���¸���eax
    div a
    cmp edx,0
    je add_tot ;����Ϊ0�ͼ�
    jmp again  ;���������ھ�����again

add_tot:
    add ecx,a
    jmp again

final:
    mov tot,ecx
    mov eax,tot
    ret 
perfetNum endp

end main

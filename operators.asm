
INCLUDE Irvine32.inc
.data
    a dd ?
    b dd ?
    choice dd ?
    msg1 db "1)�ӷ�",0
    msg2 db "2)����",0
    msg3 db "3)�˷�",0
    msg4 db "4)����",0
    msg5 db "��ѡ����������: ",0
    msg6 byte "�������1������: ",13,0,0
    msg7 byte "�������2������: ",13,0,0
    msg8 byte "������: ",13,0,0
    msg9 byte "���������������q�˳�",13,0,0
    msg10 byte "��Ч��������������",13,0,0

    ; msg dd offset msg1
    ;     dd offset msg2
    ;     dd offset msg3
    ;     dd offset msg4
    ;     dd offset msg5
    ;     dd offset msg6
    ;     dd offset msg7
    ;     dd offset msg8
    ;     dd offset msg9
     
.code
main PROC 

again:
    call clrscr;����
    call showMenu
    ; call readOpands
    call readint
    mov choice,eax
    cmp choice,1
    jl again
    cmp choice,4
    jg again
    call readOpands
    mov eax,choice
    jmp ops[4*eax-4]

op_add:
     mov eax,a
     add eax,b
     mov edx,offset msg8
     call writestring
     call crlf
     call writeint
     jmp final;
op_sub:
     mov eax,a
     sub eax,b
     mov edx,offset msg8
     call writestring
     call crlf
     call writeint
     jmp final
op_mul:
     mov eax,a
     mul b
     mov edx,offset msg8
     call writestring
     call crlf
     call writeint
     jmp final
op_div:
     mov eax,a
     mov edx,0
     div b
     push edx
     mov edx,offset msg8
     call writestring;"������"
     call crlf
     call writeint; ��
     call crlf
     pop edx
     mov eax,edx; ����
     call writeint
     call crlf
     jmp final
final:
     call crlf
     lea edx,msg9;mov edx,offset msg9
     call writestring
     call readchar
     cmp al,'q'
     jz final1
     cmp al,'Q'
     jz final1
     jmp again
       

final1:
	exit

;"Ҫд��main��������ֲ���ִ�е������Է���exit��"
ops dd offset op_add
    dd offset op_sub
    dd offset op_mul
    dd offset op_div


main ENDP

readOpands proc
    ; call readint
    ; mov choice,eax
    mov edx,offset msg6
    call writestring
    call readint
    mov a,eax
    mov edx,offset msg7
    call writestring
    call readint
    mov b,eax
    ret
readOpands endp

showMenu proc
    mov edx,offset msg1
    call writestring
    call crlf
    mov edx,offset msg2
    call writestring
    call crlf
    mov edx,offset msg3
    call writestring
    call crlf
    mov edx,offset msg4
    call writestring
    call crlf
    mov edx,offset msg5
    call writestring
    call crlf
    ret
showMenu endp

END main
;找出四个完美数

include Irvine32.inc
.data
    tot dd 0
    cnt dd 0;记录当前完美数的个数
    a dd 0
    num dd 0;当前测试的值
    cur_num dd ?

.code
main proc

again:
    cmp cnt,4
    jae final;大于四就停止
    inc num;从1开始
    mov ebx,num
    call perfetNum;参数为ebx,返回值eax
    cmp eax,num
    je output;相等就输出
    jmp again;不等就继续循环

output:
    inc cnt
    call writeDec
    call crlf
    jmp again

final:
    exit
main endp

perfetNum proc
    ;参数ebx
    ;a当前测试是不是因数的值
    mov a,0
    mov ecx,0;ecx 总的因数加起来的值
    mov cur_num,ebx
again:
    inc a;真因数从1开始
    cmp a,ebx
    jae final;
    mov edx,0;edx 余数   ;除法一定要用到edx
    mov eax,cur_num;每次都要把cur_num重新赋给eax
    div a
    cmp edx,0
    je add_tot ;余数为0就加
    jmp again  ;余数不等于就跳到again

add_tot:
    add ecx,a
    jmp again

final:
    mov tot,ecx
    mov eax,tot
    ret 
perfetNum endp

end main

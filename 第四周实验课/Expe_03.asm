;编程实现正整数的素数分解

include Irvine32.inc
.data
    num dd ?
    i dd 1
.code

main proc

    call readint
    ; mov num,eax

again1:   ;外层循环
    inc i ;每次循环i要+1;i初始值为2
    cmp i,eax;i>num 就结束程序。注意i==eax还要继续执行，不能结束
    ja final

again2:
    push eax
    mov edx,0
    div i
    pop eax
    cmp edx,0
    je print;余数若为0就输出余数
    jmp again1;余数不为0就跳到again1将i+1


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

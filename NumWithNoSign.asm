;在屏幕中输出整数a，要求
;1.若a>0,则输出值左边不带+号
;2.若a<0,则输出值左边不带-号

include Irvine32.inc
.data
    ten dd 10;被除数默认放在eax
.code
main proc
    call readint
    cmp eax,0
    jl L1;负数就跳转到L1直接输出  
    cmp eax,0
    je L0;
    mov ecx,0;记录栈里元素的个数,初始化为0

input:;将数据存放到栈中
    cmp eax,0
    jz output;eax==0则跳转
    mov edx,0;edx清0
    div ten  ;edx存放余数，eax存放商
    push edx ; 将余数放进栈里
    inc ecx 
    jmp input


output:;从栈中输出数据部分
    cmp ecx,0
    jbe final;如果ecx=0即栈内无元素则结束程序
    pop eax
    add al,'0'
    call writechar
    dec ecx
    jmp output
    
L0:;输入为0
    mov eax,0
    add eax,'0'
    call writechar
    jmp final
L1:;输入为负数
    call writeint
final:
    exit
main endp
end main




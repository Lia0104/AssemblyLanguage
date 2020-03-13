;内存中有1个32位整数数组，编程求整数数组最大值
;的元素下标值并打印
title Expi_01.asm
include Irvine32.inc
.data
    array dword 0,1,2,3,4,5,6,43180,432
    num dd ($-array)/4
    ;$ num 在内存中的首地址
    ;因此这个计算数组大小的用法要求num要定义在array之后首个
    ; 一个字节8位 4个字节32位 
    max dd ?
.code
main proc

    ;寄存器有 eax,ebx,ecx,edx,esi,edi,(ebp,esp 尽量不要使用)
    mov eax,array[0]  ;当前最大值
    mov esi,0 ; 最大值的下标
    mov ecx,0;当前遍历数组元素的下标
again:  
    ;jb,ja,je 无符号数的比较
    ;jl,je,jg 有符号数的比较
    cmp ecx,num   ;如果下标大于数组大小就结束
    jae final     ;jae 大于等于执行跳转
    
    ;cmp max,array[ecx*4] ;这两个中要有一个是寄存器，不能两个都是内存变量
    cmp eax,array[ecx*4]
    jge next ;eax大于当前元素则跳到next 有符号数的比较
    mov eax,array[ecx*4];否则更新eax
    mov esi,ecx ;更新最大值下标esi


next:        
    add ecx,1
    jmp again

final:
    call
    call writeint ;输出eax，也就是当前最大值
    call crlf
    mov eax,esi
    call writeint  ;输出最大值下标
    exit
    
main endp
end main



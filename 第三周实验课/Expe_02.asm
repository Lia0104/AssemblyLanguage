;定义3个大小不同32位数组，分别求这3个整数数组最大值的元素下标并打印

;改写法采用函数调用的方式
;通过寄存器传递函数
title Expi_02.asm
include Irvine32.inc
.data
    array dword 0,1,9,3,4,5,6
    num dd ($-array)/4
    array1 dword 8,1,2,3,4,5,6
    num1 dd ($-array1)/4
    array2 dword 0,1,19,3,4,5,6
    num2 dd ($-array2)/4

.code
main proc
    mov edx,offset array;edx放数组首地址
    mov ebx,num;ebx 放数组大小
    call maxi

    mov edx,offset array1;edx放数组首地址
    mov ebx,num1;ebx 放数组大小
    call maxi

    mov edx,offset array2;edx放数组首地址
    mov ebx,num2;ebx 放数组大小
    call maxi

    exit
main endp


;采用寄存器方式传递参数
maxi proc
    ;input: （传入参数）
    ;   edx数组首地址
    ;   ebx是数组的元素个数

    ;mov eax,dword [edx]  ;当前最大值
    mov eax,dword ptr[edx]; dword 告诉他四个字节一个单位
    mov esi,0 ;最大值下标
    mov ecx,0;当前遍历数组元素的下标
again:
    cmp ecx,ebx   ;如果下标大于数组大小就结束
    jae final     ;jae 大于等于执行跳转
    
    ;cmp max,array[ecx*4] ;这两个中要有一个是寄存器，不能两个都是内存变量
    cmp eax,dword ptr[edx+ecx*4]
    jge next ;eax大于当前元素 跳到
    mov eax,dword ptr[edx+ecx*4];否则更新eax
    mov esi,ecx


next:        
    add ecx,1
    jmp again

final:
    call writeint
    call crlf
    mov eax,esi
    call writeint
    call crlf
    ret ;函数最后一步:返回
maxi endp



end main
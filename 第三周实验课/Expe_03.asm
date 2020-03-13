; 内存中有1个32位整数数组，编程用"选择排序"方
; 法对该整个数组排序并打印该数组排序前后的值

title Expi_03.asm
include Irvine32.inc
.data
    array dword 0,1,9,3,4,5,6,312,99,23,99,22
    num dd ($-array)/4  
.code

;ebx指向当前数组应该处理的大小
main proc
    mov edx,offset array; edx存放数组
    mov ecx,num ;ecx 数组大小
    call outArray;(参数：ecx，edx) 
    mov ebx,num

 again:
    cmp ebx,1  ;最后一个不用处理，跳转到final
    jbe final 
    call maxi    ;调用函数找到最大值下标，存储在esi

    ;array[4*ebx-4]，array[4*esi] 在eax的帮助下兑对换部分
    mov eax,array[4*esi]    
    ;mov array[4*esi],array[4*ebx-4] 两个都是内存，错！
    mov edi,array[4*ebx-4]; []里不允许再出现();
    mov array[4*esi],edi ;以上两条语句相当于上注释的语句
    mov array[4*ebx-4],eax

    sub ebx,1
    jmp again

final:
    mov edx,offset array
    mov ecx,num
    call outArray
    exit
main endp

outArray proc ;打印数组
    mov esi,0;esi记录数组下标，从0开始
again:
    cmp ecx,1
    jl final

    mov eax,dword ptr[edx+4*esi]
    call writeint
    mov al,','
    call writechar

    sub ecx,1
    add esi,1;数组的下标加1
    jmp again
final:
    call crlf
    ret
outArray endp


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
    ret ;函数最后一步:返回
maxi endp



end main
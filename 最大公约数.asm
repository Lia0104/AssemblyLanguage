;从键盘输入一个包含表示2个正整数的字符串
;求所包含正整数的最大公约数

;1.将输入的字符串分离成两个数字字符串
;2.将数字字符串转换为数字类型



;寄存器只有八个，能随便用只有6个，以便重复利用寄存器。
;在调用函数之前，将寄存器push进入栈，防止原来在主函数保存的值丢失，以便保存调用函数里的值
;调用函数要返回时，再从栈里面将原来的值pop倒寄存器里，返回到主函数
;push ad,pop ad可以一次性将八个寄存器入栈出栈

;遵循一种标准，将函数的返回值都放在eax

include Irvine32.inc

.data
    buffer db 128 dup(0)
    len dd ?
    str1 db 128 dup(0)
    len1 dd ?
    str2 db 128 dup(0)
    len2 dd ?
.code

main proc
    call input

    lea edi,buffer 
    mov al,' '
    mov ecx,len
    cld;操作方向标志位DF,cld使DF复位，即是让DF=0,存储器地址自动增加
    repne scasb
    push edi

    mov ecx,edi
    lea esi,buffer
    lea edi,str1
    sub ecx,esi
    mov len1,ecx;并不是第一个字符串的长度，多了一个空格符
    cld
    rep movsb
    
    mov ecx,len
    sub ecx,len1
    mov len2,ecx
    pop esi
    lea edi,str2
    cld
    rep movsb

    lea edx,buffer
    call writestring;writestring 只能用edx?
    call crlf
    lea esi,str2
    mov ecx,len2
again:
    cmp ecx,0
    jz final
    cmp byte ptr[esi],' '
    jnz final
    inc esi
    dec ecx
    jmp again
final:
    mov edx,esi
    call writestring
    
    ; lea edx,str1
    ; call writestring
    ; call crlf
    ; lea edx,str2
    ; call writestring
    




    exit

main endp


input proc
    lea edx,buffer;mov edx,offset buffer
    mov ecx,128
    call readstring;会将字符长度放在eax
    mov len,eax
    ret
input endp


end main





; data segment
; input db "please input a string:",'$'
; output db "your input is:",'$'
; buffer  db 20
;         db ?
;         db 20 dup(0)
; crlf db 0AH,0DH,'$'
; data ends




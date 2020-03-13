include Irvine32.inc
.data
    max dword ?
.code 
main proc
    call readint;读入数字
    mov max,eax;将读入的数字放入max
    mov ebx,0 ;ebx = 0
cycle:
    cmp ebx,8 ;注意只需要到8
    ja final ;如果大于8就跳到final
    call readint ;读入数字
    inc ebx
    cmp max,eax ;比较读入的数字和max的大小
    ja cycle
    mov max,eax ;如果max小于eax就更新max
    jmp cycle
final:
    mov eax,max  
    call writeint  ;输出max
    exit
main endp
end main

; include Irvine32.inc
; .data
;     max dword ?
; .code 
; main proc
;     call readint;读入数字
;     mov max,eax
;     mov ebx,0 
; cycle:
;     cmp ebx,8 
;     ja final ;如果大于8就跳到final函数
;     call readint ;读入数字
;     cmp max,eax ;比较读入的数字和max的大小
;     ja continue ;如果max大于eax就跳到continue执行下一轮循环
;     mov max,eax ;如果max小于eax就更新max
; continue:
;     inc ebx ;inc 指令+1
;     jmp cycle
; final:
;     mov eax,max  
;     call writeint  ;输出max
;     exit
; main endp
; end main












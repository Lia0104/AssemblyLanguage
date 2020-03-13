
include Irvine32.inc
.data 
    
    a dd 2
    b dd 9

.code
main proc
    mov edx,0
    mov eax,b
    div a
    call writeint
    mov eax,edx
    call writeint
    exit
    
main endp
end main

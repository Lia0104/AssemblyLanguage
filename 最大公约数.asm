;�Ӽ�������һ��������ʾ2�����������ַ���
;�������������������Լ��

;1.��������ַ�����������������ַ���
;2.�������ַ���ת��Ϊ��������



;�Ĵ���ֻ�а˸����������ֻ��6�����Ա��ظ����üĴ�����
;�ڵ��ú���֮ǰ�����Ĵ���push����ջ����ֹԭ���������������ֵ��ʧ���Ա㱣����ú������ֵ
;���ú���Ҫ����ʱ���ٴ�ջ���潫ԭ����ֵpop���Ĵ�������ص�������
;push ad,pop ad����һ���Խ��˸��Ĵ�����ջ��ջ

;��ѭһ�ֱ�׼���������ķ���ֵ������eax

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
    cld;���������־λDF,cldʹDF��λ��������DF=0,�洢����ַ�Զ�����
    repne scasb
    push edi

    mov ecx,edi
    lea esi,buffer
    lea edi,str1
    sub ecx,esi
    mov len1,ecx;�����ǵ�һ���ַ����ĳ��ȣ�����һ���ո��
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
    call writestring;writestring ֻ����edx?
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
    call readstring;�Ὣ�ַ����ȷ���eax
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




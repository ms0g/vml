
%define FLOAT_SIZE 4
section .text
global __vec_add
global __vec_sub
global __vec_mul
global __vec_div
global __vec_max
global __vec_min
global __vec_norm
global __vec_abs
global __vec_sadd
global __vec_ssub
global __vec_smul
global __vec_sdiv
global __vec_len
global __vec_neg
global __vec_dot
global __vec3_cross
extern _calloc

; __vec_add(v1, v2, len)
; 
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_add:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    addps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_sub(v1, v2, len)
; 
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_sub:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx 
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    subps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_mul(v1, v2, len)
;
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_mul:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx 
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    mulps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_div(v1, v2, len)
;
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_div:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx 
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    divps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_max(v1, v2, len)
;
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_max:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx 
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    maxps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_min(v1, v2, len)
;
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_min:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx 
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    minps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_norm(v1, len)
;
;   rdi = v1
;   rsi = len
;   
__vec_norm:
    sub rsp, 8 
    push rdi
    push rsi
    mov rdi, rsi
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rsi
    pop rdi
    call __vec_len
    xorps xmm1, xmm1
    ucomiss xmm0, xmm1 ; if len is zero, we are done
    je .done
    movss xmm1, xmm0
    shufps xmm1, xmm1, 0x00 ;
    xor rcx, rcx
.l:
    movups xmm0, [rdi + rcx * 4]
    divps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rsi, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    add rsp, 8
    ret


; __vec_neg(v1, len)
;
;   rdi = v1
;   rsi = len
;   
__vec_neg:
    sub rsp, 8 ; fix stack alignment
    push rdi
    push rsi
    mov rdi, rsi
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rsi
    pop rdi
    xor rcx, rcx
    mov rdx, -1
    cvtsi2ss xmm1, rdx
    shufps xmm1, xmm1, 0x00 ; fill xmm1 with -1
.l:
    movups xmm0, [rdi + rcx * 4]
    mulps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rsi, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    add rsp, 8
    ret


; __vec_abs(v1, len)
;
;   rdi = v1
;   rsi = len
;   
__vec_abs:
    sub rsp, 8 ; fix stack alignment
    push rdi
    push rsi
    mov rdi, rsi
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rsi
    pop rdi
    xor rcx, rcx
.l:
    movups xmm0, [rdi + rcx * 4]
    pabsd xmm0, xmm0
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rsi, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    add rsp, 8
    ret


; __vec_add_s(v1, s, len)
; 
;   rdi = v1
;   rsi = s
;   rdx = len
;   
__vec_sadd:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx
    cvtsi2ss xmm1, rsi
    shufps xmm1, xmm1, 0x00 ; fill xmm1 with s
.l:
    movups xmm0, [rdi + rcx * 4]
    addps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_sub_s(v1, s, len)
; 
;   rdi = v1
;   rsi = s
;   rdx = len
;   
__vec_ssub:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx
    cvtsi2ss xmm1, rsi
    shufps xmm1, xmm1, 0x00 ; fill xmm1 with s
.l:
    movups xmm0, [rdi + rcx * 4]
    subps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_mul_s(v1, s, len)
; 
;   rdi = v1
;   rsi = s
;   rdx = len
;   
__vec_smul:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx
    cvtsi2ss xmm1, rsi
    shufps xmm1, xmm1, 0x00 ; fill xmm1 with s
.l:
    movups xmm0, [rdi + rcx * 4]
    mulps xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_div_s(v1, s, len)
; 
;   rdi = v1
;   rsi = s
;   rdx = len
;   
__vec_sdiv:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi
    xor rcx, rcx
    cvtsi2ss xmm1, rsi
    shufps xmm1, xmm1, 0x00 
.l:
    movups xmm0, [rdi + rcx * 4]
    divss xmm0, xmm1
    movq [rax + rcx * 4], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + rcx * 4 + 8], xmm0 ;
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret


; __vec_len(v1, len)
; 
;   rdi = v1
;   rsi = len
;   
__vec_len:
   xor rcx, rcx
   xorps xmm1, xmm1
.l:
    movups xmm0, [rdi + rcx * 4]
    mulps xmm0, xmm0 ; square each element
    haddps xmm0, xmm0 ; horizontal add
    haddps xmm0, xmm0
    addss xmm1, xmm0
    add rcx, 4
    sub rsi, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    sqrtps xmm0, xmm1  ; square root
    ret


; __vec_dot(v1, v2, len)
; 
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec_dot:
   xor rcx, rcx
   xorps xmm2, xmm2
   xorps xmm0, xmm0
   xorps xmm1, xmm1
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    mulps xmm0, xmm1
    haddps xmm0, xmm0 ; horizontal add
    haddps xmm0, xmm0
    addss xmm2, xmm0
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    movss xmm0, xmm2
    ret


; __vec_cross(v1, v2, len)
; 
;   rdi = v1
;   rsi = v2
;   rdx = len
;   
__vec3_cross:
    push rdi
    push rsi
    push rdx
    mov rdi, rdx
    mov rsi, FLOAT_SIZE
    call _calloc
    pop rdx
    pop rsi
    pop rdi

    movups xmm0, [rdi]
    movups xmm1, [rsi]
    movaps xmm2,xmm0         ;Copies
    movaps xmm3,xmm1

    shufps xmm0,xmm0,0xd8    ;Exchange 2 and 3 element (V1)
    shufps xmm1,xmm1,0xe1    ;Exchange 1 and 2 element (V2)
    mulps  xmm0,xmm1
               
    shufps xmm2,xmm2,0xe1    ;Exchange 1 and 2 element (V1)
    shufps xmm3,xmm3,0xd8    ;Exchange 2 and 3 element (V2)
    mulps  xmm2,xmm3
              
    subps  xmm0,xmm2
    movq [rax], xmm0 ; lower 64 bits
    movhlps xmm0,xmm0 ; move high 64 bits to low 64 bits.
    movq [rax + 8], xmm0 ;
.done:
    ret

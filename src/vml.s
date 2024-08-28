section .text
global __vec_add
global __vec_sub
global __vec_mul
global __vec_div
global __vec_max
global __vec_min
global __vec_sadd
global __vec_ssub
global __vec_smul
global __vec_sdiv
global __vec_neg
global __vec_abs
global __vec_norm
global __vec_len
global __vec_dot

; -------------------------------------------------------------
; void _vec_add(float* result, float* v1, float* v2, int len)  ;
; rdi = result                                                 ;
; rsi = v1                                                     ;
; rdx = v2                                                     ;
; rcx = len                                                    ;
; -------------------------------------------------------------
__vec_add:
    xor r8, r8
.l:
    movups xmm0, [rsi + r8 * 4]
    movups xmm1, [rdx + r8 * 4]
    addps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; -------------------------------------------------------------
; void _vec_sub(float* result, float* v1, float* v2, int len)  ;
; rdi = result                                                 ;
; rsi = v1                                                     ;
; rdx = v2                                                     ;
; rcx = len                                                    ;
; -------------------------------------------------------------
__vec_sub:
    xor r8, r8 
.l:
    movups xmm0, [rsi + r8 * 4]
    movups xmm1, [rdx + r8 * 4]
    subps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; -------------------------------------------------------------
; void _vec_mul(float* result, float* v1, float* v2, int len)  ;
; rdi = result                                                 ;
; rsi = v1                                                     ;
; rdx = v2                                                     ;
; rcx = len                                                    ;
; -------------------------------------------------------------
__vec_mul:
   xor r8, r8 
.l:
    movups xmm0, [rsi + r8 * 4]
    movups xmm1, [rdx + r8 * 4]
    mulps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; -------------------------------------------------------------
; void _vec_div(float* result, float* v1, float* v2, int len)  ;
; rdi = result                                                 ;
; rsi = v1                                                     ;
; rdx = v2                                                     ;
; rcx = len                                                    ;
; -------------------------------------------------------------
__vec_div:
    xor r8, r8 
.l:
    movups xmm0, [rsi + r8 * 4]
    movups xmm1, [rdx + r8 * 4]
    divps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; -------------------------------------------------------------
; void _vec_max(float* result, float* v1, float* v2, int len)  ;
; rdi = result                                                 ;
; rsi = v1                                                     ;
; rdx = v2                                                     ;
; rcx = len                                                    ;
; -------------------------------------------------------------
__vec_max:
    xor r8, r8 
.l:
    movups xmm0, [rsi + r8 * 4]
    movups xmm1, [rdx + r8 * 4]
    maxps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; -------------------------------------------------------------
; void _vec_min(float* result, float* v1, float* v2, int len)  ;
; rdi = result                                                 ;
; rsi = v1                                                     ;
; rdx = v2                                                     ;
; rcx = len                                                    ;
; -------------------------------------------------------------
__vec_min:
    xor r8, r8 
.l:
    movups xmm0, [rsi + r8 * 4]
    movups xmm1, [rdx + r8 * 4]
    minps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; --------------------------------------------------------------
; void _vec_sadd(float* result, float* v1, int scalar, int len) ;
; rdi = result                                                  ;
; rsi = v1                                                      ;
; rdx = scalar                                                  ;
; rcx = len                                                     ;
; --------------------------------------------------------------  
__vec_sadd:
    xor r8, r8
    cvtsi2ss xmm1, rdx
    shufps xmm1, xmm1, 0x00         ;fill xmm1 with scalar
.l:
    movups xmm0, [rsi + r8 * 4]
    addps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; --------------------------------------------------------------
; void _vec_ssub(float* result, float* v1, int scalar, int len) ;
; rdi = result                                                  ;
; rsi = v1                                                      ;
; rdx = scalar                                                  ;
; rcx = len                                                     ;
; -------------------------------------------------------------- 
__vec_ssub:
    xor r8, r8
    cvtsi2ss xmm1, rdx
    shufps xmm1, xmm1, 0x00         ;fill xmm1 with scalar
.l:
    movups xmm0, [rsi + r8 * 4]
    subps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; --------------------------------------------------------------
; void _vec_smul(float* result, float* v1, int scalar, int len) ;
; rdi = result                                                  ;
; rsi = v1                                                      ;
; rdx = scalar                                                  ;
; rcx = len                                                     ;
; --------------------------------------------------------------
__vec_smul:
    xor r8, r8
    cvtsi2ss xmm1, rdx
    shufps xmm1, xmm1, 0x00         ;fill xmm1 with scalar
.l:
    movups xmm0, [rsi + r8 * 4]
    mulps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits 
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; --------------------------------------------------------------
; void _vec_sdiv(float* result, float* v1, int scalar, int len) ;
; rdi = result                                                  ;
; rsi = v1                                                      ;
; rdx = scalar                                                  ;
; rcx = len                                                     ;
; -------------------------------------------------------------- 
__vec_sdiv:
    xor r8, r8
    xorps xmm0, xmm0
    xorps xmm1, xmm1
    cvtsi2ss xmm1, rdx
    shufps xmm1, xmm1, 0x00 
.l:
    movups xmm0, [rsi + r8 * 4]
    divps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; ------------------------------------------------------------
; void _vec_neg(float* result, float* v1, int len)            ;   
; rdi = result                                                ;
; rsi = v1                                                    ;  
; rdx = len                                                   ;                                             
; ------------------------------------------------------------
__vec_neg:
    mov rcx, rdx
    xor r8, r8
    mov rdx, -1
    cvtsi2ss xmm1, rdx
    shufps xmm1, xmm1, 0x00         ;fill xmm1 with -1
.l:
    movups xmm0, [rsi + r8 * 4]
    mulps xmm0, xmm1
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rcx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; ------------------------------------------------------------
; void _vec_abs(float* result, float* v1, int len)            ;   
; rdi = result                                                ;
; rsi = v1                                                    ;  
; rdx = len                                                   ;                                             
; ------------------------------------------------------------
__vec_abs:
   xor r8, r8
.l:
    movups xmm0, [rsi + r8 * 4]
    pabsd xmm0, xmm0
    movq [rdi + r8 * 4], xmm0       ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + r8 * 4 + 8], xmm0   ;upper 64 bits
    add r8, 4
    sub rdx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    ret

; ------------------------------------------------------------
; void _vec_norm(float* result, float* v1, int len)           ;   
; rdi = result                                                ;
; rsi = v1                                                    ;  
; rdx = len                                                   ;                                             
; ------------------------------------------------------------
__vec_norm:
    push rdi
    push rsi
    mov rdi, rsi
    mov rsi, rdx
    call __vec_len
    xorps xmm1, xmm1
    ucomiss xmm0, xmm1      ;if len is zero, we are done
    je .done
    movss xmm1, xmm0
    shufps xmm1, xmm1, 0x00
    xor rcx, rcx
    pop rsi
    pop rdi
.l:
    movups xmm0, [rsi + rcx * 4]
    divps xmm0, xmm1
    movq [rdi + rcx * 4], xmm0      ;lower 64 bits
    movhlps xmm0, xmm0              ;move high 64 bits to low 64 bits.
    movq [rdi + rcx * 4 + 8], xmm0  ;upper 64 bits
    add rcx, 4
    sub rdx, 4
    je .done ; if len is zero, we are done
    js .done ; if len is negative, we are done
    jns .l ; if len is positive, go to loop
.done:
    ret

; ------------------------------------------------------------
; float _vec_len(float* v1, int len)                          ;   
; rdi = v1                                                    ;
; rsi = len                                                   ;                                               
; ------------------------------------------------------------
__vec_len:
   xor rcx, rcx
   xorps xmm1, xmm1
   xorps xmm0, xmm0
.l:
    movups xmm0, [rdi + rcx * 4]
    mulps xmm0, xmm0        ;square each element
    haddps xmm0, xmm0       ;horizontal add
    haddps xmm0, xmm0
    addss xmm1, xmm0
    add rcx, 4
    sub rsi, 4
    je .done                ;if len is zero, we are done
    js .done                ;if len is negative, we are done
    jns .l                  ;if len is positive, go to loop
.done:
    sqrtps xmm0, xmm1       ;square root
    ret

; -------------------------------------------------------------
; float _vec_dot(float* v1, float* v2, int len)                ;
; rdi = v1                                                     ;
; rsi = v2                                                     ;
; rdx = len                                                    ;
; -------------------------------------------------------------
__vec_dot:
   xor rcx, rcx
   xorps xmm2, xmm2
   xorps xmm0, xmm0
   xorps xmm1, xmm1
.l:
    movups xmm0, [rdi + rcx * 4]
    movups xmm1, [rsi + rcx * 4]
    mulps xmm0, xmm1
    haddps xmm0, xmm0   ;horizontal add
    haddps xmm0, xmm0
    addss xmm2, xmm0
    add rcx, 4
    sub rdx, 4
    je .done    ;if len is zero, we are done
    js .done    ;if len is negative, we are done
    jns .l      ;if len is positive, go to loop
.done:
    movss xmm0, xmm2
    ret
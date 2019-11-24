; stack frame
; ====================
; BP + 8| size
; BP + 6| src
; BP + 4| dst
; ------|-----
; BP + 2| IP(戻り番地)
; BP    | BP(元の値)

; void memcpy(dst, src, size)
memcpy:
    push  bp
    mov   bp, sp

    ; 以下3レジスタを保存
    push  cx
    push  si
    push  di

    ; メモリコピー
    cld
    mov   di, [bp + 4]
    mov   si, [bp + 6]
    mov   cx, [bp + 8]
    rep   movsb

    ; 復帰
    pop   di
    pop   si
    pop   cx

    mov   sp, bp
    pop   bp
    ret

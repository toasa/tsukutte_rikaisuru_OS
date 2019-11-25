; stack frame
; ====================
; EBP + 16| size
; EBP + 12| src
; EBP + 8 | dst
; --------|-----
; EBP + 4 | EIP(戻り番地)
; EBP     | EBP(元の値)

; void memcpy(dst, src, size)
memcpy:
    push  ebp
    mov   ebp, esp

    ; 以下3レジスタを保存
    push  ecx
    push  esi
    push  edi

    ; メモリコピー
    cld
    mov   edi, [bp + 8]
    mov   esi, [bp + 12]
    ; counter
    mov   ecx, [bp + 16]
    ; repeat
    ; `while (cx--) { movsb; }`と同等
    rep   movsb

    ; 復帰
    pop   edi
    pop   esi
    pop   ecx

    mov   esp, ebp
    pop   ebp
    ret

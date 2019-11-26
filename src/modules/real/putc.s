; BP + 4| c
; ------|-----
; BP + 2| IP(戻り番地)
; BP    | BP(元の値)

; void putc(char c)
putc:
    push   bp
    mov    bp, sp

    ; 使用するレジスタの保存
    push   ax
    push   bx

    ; １文字出力
    ; AL = 出力文字
    ; BX: ページ番号と文字色を0に設定
    mov    al, [bp + 4]
    mov    ah, 0x0E
    mov    bx, 0x0000
    int    0x10

    pop    bx
    pop    ax

    mov    sp, bp
    pop    bp
    ret
; BP + 4| str
; ------|-----
; BP + 2| IP(戻り番地)
; BP    | BP(元の値)

; void putc(char c)
puts:
    push   bp
    mov    bp, sp

    ; 使用するレジスタの保存
    push   ax
    push   bx
    push   si

    ; 引数である文字列を取得
    mov    si, [bp + 4]

    ; DF(Direction Flag)のクリア
    ; 連続したメモリアクセス時に + 方向にアドレスをすすめる
    cld

loop_begin:
    ; SI レジスタで指定されたアドレスから1バイトを AL レジスタにロードし、SIレジスタの値をすすめる
    lodsb
    ; 文字が NULL(0)ならば、put処理を抜ける
    cmp    al, 0
    jz     loop_end

    ; １文字出力
    mov    ah, 0x0E
    mov    bx, 0x0000
    int    0x10
    jmp    loop_begin
loop_end:

    ; 復帰
    pop    si
    pop    bx
    pop    ax

    mov    sp, bp
    pop    bp
    ret
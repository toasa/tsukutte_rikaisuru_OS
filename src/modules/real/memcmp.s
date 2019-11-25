; stack frame
; ====================
; BP + 8| size
; BP + 6| src1
; BP + 4| src0
; ------|-----
; BP + 2| IP(戻り番地)
; BP    | BP(元の値)

; src0 と src1 の size バイト分メモリを比較する
; 戻り値 => 0: 一致、 1: 不一致
; int memcmp(src0, src1, size)
memcpy:
    push  bp
    mov   bp, sp

    ; レジスタの保存
    push  bx
    push  cx
    push  dx
    push  si
    push  di

    ; DF(Direction Flag)のクリア
    ; 連続したメモリアクセス時に + 方向にアドレスをすすめる
    cld
    mov   si, [bp + 4]
    mov   di, [bp + 6]
    mov   cx, [bp + 8]

    ; repe: (cx == 0 or ZF == 0)となるまで命令を繰り返す。
    ;       repeat のたびに cx--; を行う
    ; cmpsb: si と di のメモリを比較し、フラグを設定する
    ;        比較後、1B メモリを + 方向にすすめる
    repe  cmpsb
    jnz   .10F
    mov   ax, 0
    jmp   .10E
.10F:
    mov   ax, -1
.10E:

    ; 復帰
    pop   di
    pop   si
    pop   dx
    pop   cx
    pop   bx

    mov   sp, bp
    pop   bp
    
    ret

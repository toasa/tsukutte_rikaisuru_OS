    ; IPL（ブートプログラム）のロード位置
    BOOT_LOAD  equ  0x7C00
    ; IPLのロードアドレスを0x7C00に変更
    ORG    BOOT_LOAD
    
; Entry point
entry:
    jmp    ipl

    ; BPB(Boot Parameter Block)
    ; 90B分のBPB領域に対し、NOPE命令を埋める
    times  90 - ($ - $$) db 0x90

; IPL(Initial Program Loader)
ipl:
    ; 割り込み禁止
    cli

    ; 各セグメントレジスタを初期化
    mov    ax, 0x0000
    mov    ds, ax
    mov    es, ax
    mov    ss, ax
    mov    sp, BOOT_LOAD

    ; 割り込み許可
    sti

    ; BIOS はブートプログラムに制御を移す時、
    ; ブートプログラムが保存されていた外部記憶装置の番号を
    ; DLレジスタに格納する。
    ; その番号をブートドライブを保存
    mov    [BOOT.DRIVE], dl

    ; while (1); 無限ループ
    jmp    $

ALIGN 2, db 0
BOOT:
.DRIVE:  dw 0

; Boot flag
    times  510 - ($ - $$) db 0x00
    ; BIOSがブートプログラムと判断するために
    ; 先頭から510バイトの位置に 0x55, 0xAA
    ; を書き込む
    db     0x55, 0xAA
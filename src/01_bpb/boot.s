; Entry point
    jmp    ipl

    ; BPB(Boot Parameter Block)
    ; 90B分のBPB領域に対し、NOPE命令を埋める
    times  90 - ($ - $$) db 0x90

    ; IPL(Initial Program Loader)
ipl:
    ; while (1); 無限ループ
    jmp    $

; Boot flag
    times  510 - ($ - $$) db 0x00
    ; BIOSがブートプログラムと判断するために
    ; 先頭から510バイトの位置に 0x55, 0xAA
    ; を書き込む
    db     0x55, 0xAA
; Check numbers of Prime in 6502 assembly language

start: 
         .org $0c00
a9 01    lda #$01        ; 上面 BASIC 程式的 NUMPRIME
8d ff oc sta NUMPRIME
a9 ff    lda #$ff        ; 上面 BASIC 程式的 ISIT
8d fd 0c sta ISIT

newisit:                 ; 相對位址 0c0a, 可能需要修改
48       pha
4a       lsr a
aa       tax
e8       inx             ; x 是上面 BASIC 程式的 TEST = ISIT /2 + 1
8e fe 0c stx TEST
68       pla           

checkprime:              ; 相對位址 0c12, 可能需要修改
20 42 0c jsr isprime     ; 進入時, a 是 ISIT; x 是 TEST, 返回結果如果不是 prime number, carry 設成 1
b0 0d    bcs nonprime    ; 跳到相對位址, 可能需要修改
ce fe 0c dec TEST        ; 如果是 prime number, 如果 TEST >= 2, 將 TEST - 1 後繼續
ae fe 0c ldx TEST       
e0 01    cpx #$01
f0 10    beq nextisit    ; 跳到相對位址 0c2e, 可能需要修改
4c 12 0c jmp checkprime  ; 相對位址 0c12, 可能需要修改

nonprime:                ; 相對位址 0c24, 可能需要修改
                         ; 如果不是 prime number, 繼續檢查下一個 ISIT
ce fd 0c dec ISIT        
ad fd 0c lda ISIT
c9 02    cmp #$02
f0 13    beq complete    ; 跳到相對位址 0c41, 可能需要修改
4c 0a 0c jmp newisit

nextisit:                ; 相對位址 0c31, 可能需要修改
ee ff 0c inc NUMPRIME    ; 確定是 prime number, 增加一個 NUMPRIME
ce fd 0c dec ISIT        ; 繼續檢查下一個 ISIT
ad fd 0c lda ISIT
c9 02    cmp #$02
f0 03    beq complete
4c 0a 0c jmp newisit

complete:                ; 相對位址 0c41, 可能需要修改
60       rts

isprime:                 ; 相對位址 0c42, 可能需要修改
                         ; ISIT = ISIT - TEST 一直到 ISIT < TEST 為止 
ad fd 0c lda ISIT
primecontinue:           ; 相對位址 0c45, 可能需要修改
cd fe 0c cmp TEST
90 08    bcc iszero      ; ISIT < TEST 時進入檢查
38       sec             ; ISIT >= TEST
ed fe 0c sbc TEST
4c 45 0c jmp primecontinue
60       rts    

iszero:                   ; 相對位址 0c52, 可能需要修改
                          ; ISIT < TEST 時進入檢查
c9 00    cmp #$00 
f0 02    beq confirmzero
18       clc
60       rts    
confirmzero:
38       sec
60       rts    


ISIT     eq     $0cfd
TEST     eq     $0cfe
NUMPRIME eq     $0cff

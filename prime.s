; Check numbers of Prime in 6502 assembly language

start 
	org $0c00
	lda #$01        ; 上面 BASIC 程式的 NUMPRIME
	sta NUMPRIME
	lda #$ff        ; 上面 BASIC 程式的 ISIT
	sta ISIT

newisit                 ; 相對位址 0c0a, 可能需要修改
	pha
	lsr
	tax
	inx             ; x 是上面 BASIC 程式的 TEST = ISIT /2 + 1
	stx TEST
	pla           

checkprime              ; 相對位址 0c12, 可能需要修改
	jsr isprime     ; 進入時, a 是 ISIT; x 是 TEST, 返回結果如果不是 prime number, carry 設成 1
	bcs nonprime    ; 跳到相對位址, 可能需要修改
	dec TEST        ; 如果是 prime number, 如果 TEST >= 2, 將 TEST - 1 後繼續
	ldx TEST       
	cpx #$01
	beq nextisit    ; 跳到相對位址 0c2e, 可能需要修改
	jmp checkprime  ; 相對位址 0c12, 可能需要修改

nonprime                ; 相對位址 0c24, 可能需要修改
                         ; 如果不是 prime number, 繼續檢查下一個 ISIT
	dec ISIT        
	lda ISIT
	cmp #$02
	beq complete    ; 跳到相對位址 0c41, 可能需要修改
	jmp newisit

nextisit                ; 相對位址 0c31, 可能需要修改
	inc NUMPRIME    ; 確定是 prime number, 增加一個 NUMPRIME
	dec ISIT        ; 繼續檢查下一個 ISIT
	lda ISIT
	cmp #$02
	beq complete
	jmp newisit

complete                ; 相對位址 0c41, 可能需要修改
	rts

isprime                 ; 相對位址 0c42, 可能需要修改
                         ; ISIT = ISIT - TEST 一直到 ISIT < TEST 為止 
	lda ISIT
primecontinue           ; 相對位址 0c45, 可能需要修改
	cmp TEST
	bcc iszero      ; ISIT < TEST 時進入檢查
	sec             ; ISIT >= TEST
	sbc TEST
	jmp primecontinue
	rts    

iszero                   ; 相對位址 0c52, 可能需要修改
                          ; ISIT < TEST 時進入檢查
	cmp #$00 
	beq confirmzero
	clc
	rts    
confirmzero
	sec
	rts    


ISIT     =     $0cfd
TEST     =     $0cfe
NUMPRIME =     $0cff

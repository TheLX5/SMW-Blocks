
!Min = $08		; First frame the block should kill on

print "A framal block which kills the player upon frame 0x",hex(!Min),"."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
if !sa1 == 1
	lda.b #M_SA1
	sta $0183
	lda.b #M_SA1/$100
	sta $0184
	lda.b #M_SA1/$10000
	sta $0185
	lda #$D0
	sta $2209
-	lda $018A
	beq -
	stz $018A
	rtl

M_SA1:
endif

LDA $7FC004		;\
AND #$0F		;|
CMP #!Min		;|Check if it is a correct frame
BCC R			;/

JSL $00F606		; If yes, kill the player

R:
RTL
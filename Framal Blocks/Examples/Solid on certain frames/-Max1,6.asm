
!Max = $07		; Last frame the block should be solid on

print "A framal block which is solid on first ",dec(!Max+1)," frames."

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
AND #$0F		;|Check if it is a correct frame
CMP.b #!Max+$01		;|
BCS R			;/

LDY #$01		;\
LDA #$30		;| If yes, solidify the block
STA $1693		;/

R:
RTL
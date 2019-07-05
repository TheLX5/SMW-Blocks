
!Min = $08		; First frame the block should be solid on

print "A framal block which is solid upon frame 0x",hex(!Min),"."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC004		;\
AND #$0F		;|
CMP #!Min		;|Check if it is a correct frame
BCC R			;/

LDY #$01		;\
LDA #$30		;| If yes, solidify the block
STA $1693		;/

R:
RTL

!Min = $08		; First frame the block should hurt on

print "A framal block which hurts the player upon frame 0x",hex(!Min),"."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC004		;\
AND #$0F		;|
CMP #!Min		;|Check if it is a correct frame
BCC R			;/

JSL $00F5B7		; If yes, hurt the player

R:
RTL
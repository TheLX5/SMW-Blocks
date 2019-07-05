!Max = $07		; Last frame the block should hurt on

print "A framal block which hurts the player on first ",dec(!Max+1)," frames."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC004		;\
AND #$0F		;|Check if it is a correct frame
CMP.b #!Max+$01		;|
BCS R			;/

JSL $00F5B7		; If yes, hurt the player

R:
RTL
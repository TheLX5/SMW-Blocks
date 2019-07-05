
!Min = $04		; First frame the block should kill on
!Max = $07		; Last frame the block should kill on

print "A framal block which kills the player between frames 0x",hex(!Min),"-0x",hex(!Max),"."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC004		;\
AND #$0F		;|
CMP #!Min		;|
BCC R			;| Check if it is a correct frame
CMP.b #!Max+$01		;|
BCS R			;/

JSL $00F606		; If yes, kill the player

R:
RTL
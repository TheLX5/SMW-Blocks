!Gl = $00		; $00 if it should be based on level exAnim, and $20 if it should be based on global exAnim
!Slot = $00		; exAnimation slot the hurting should be based on

!Min = $04		; First frame the block should hurt on
!Max = $07		; Last frame the block should hurt on

print "A framal block which hurts the player between frames 0x",hex(!Min),"-0x",hex(!Max),"."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC080+!Gl+!Slot	;\
CMP #!Min		;|
BCC R			;| Check if it is a correct frame
CMP.b #!Max+$01		;|
BCS R			;/

JSL $00F5B7		; If yes, hurt the player

R:
RTL

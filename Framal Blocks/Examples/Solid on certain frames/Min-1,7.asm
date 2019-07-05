!Gl = $00		; $00 if it should be based on level exAnim, and $20 if it should be based on global exAnim
!Slot = $00		; exAnimation slot the code should be based on

!Min = $08		; First frame the block should be solid on

print "A framal block which is solid upon frame 0x",hex(!Min),"."

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC080+!Gl+!Slot	;\
CMP #!Min		;| Check if it is a correct frame
BCC R			;/

LDY #$01		;\
LDA #$30		;| If yes, solidify the block
STA $1693		;/

R:
RTL

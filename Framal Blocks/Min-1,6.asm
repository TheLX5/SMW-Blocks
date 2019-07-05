
print "An undefined framal block."

!Min = $08		; First frame the code should run on

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC004		;\
AND #$0F		;|
CMP #!Min		;|Check if it is a correct frame
BCC R			;/

			; If yes, run desired code

R:
RTL

print "An undefined range framal block."

!Min = $04		; First frame the code should run on
!Max = $07		; Last frame the code should run on

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

			; If yes, run desired code

R:
RTL
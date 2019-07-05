
print "An undefined framal block."

!Gl = $00		; $00 if it should be based on level exAnim, and $20 if it should be based on global exAnim
!Slot = $00 		; exAnimation slot the code should be based on

!Max = $07 		; Last frame the code should run on

db $42
JMP M : JMP M : JMP M : JMP R : JMP R : JMP R : JMP R
JMP M : JMP M : JMP M

M:
LDA $7FC080+!Gl+!Slot	;\
CMP.b #!Max+$01		;| Check if it is a correct frame
BCS R			;/

			; If yes, run desired code

R:
RTL

print "An undefined framal block."

!Gl = $00		; $00 if it should be based on level exAnim, and $20 if it should be based on global exAnim
!Slot = $00		; exAnimation slot the code should be based on

!Min = $08		; First frame the code should run on

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

LDA $7FC080+!Gl+!Slot	;\
CMP #!Min		;| Check if it is a correct frame
BCC R			;/

			; If yes, run desired code

R:
RTL

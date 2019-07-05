
Framal blocks - to use with BTSD

These blocks act differently depending on the current exAnimation frame.
There are some examples of how to use them, including a hurt on specific
frames block, and a kill on spcecific frames block. But you can also use
the templates in the directory root to make your own block. The six blocks
are different and should be used in different occasions. below is a quick
guide so you know which one to use.


1. the number at the end of the asm files tells which version of Lunar
   magic it is compatible with

 - 1,6 for LM1.6 and older
 - 1,7 for LM1.7 and newer


2. next, decide between -max, min- and min-max, depending on which
   situation the frames that run the code are in.

 - -max for frames 00 till somewhere in the middle (example: 00-07)
 - min- for somewhere in the middle to the last frame (example: 07-[last frame])
 - min-max for frames in between the first and the last frame (example: 04-0B)


After you know which file to use, you have to set the defines in it.
This is explained inside the files, in the comments.


for advanced users:
You can also change the frame checking routine for other effects

Example:

;replace "[address]" with "LDA $7FC004 : AND #$0F" for Lunar Magic 1.6
;and with "LDA $7FC080+!Gl+!Slot" for Lunar Magic 1.7 and newer

[address]	;\
AND #$07	;| this makes the code run every eighth frame
BNE R		;/


~Sind
ASSUME CS: CODE, DS: DATA

DATA SEGMENT
       STR DB 100 dup('$')
       LEN DW $-STR
       MSG1 DB 0DH, 0AH, "Palindrome","$"
       MSG2 DB 0DH, 0AH, "Not Palindrome","$"
DATA ENDS

CODE SEGMENT
START: MOV AX, DATA
       MOV DS, AX
       LEA SI, STR

INPUT: MOV AH,1
       INT 21H
       CMP AL,13
       JE L1
       MOV [SI], AL
       INC SI
       JMP INPUT

L1:    MOV DI, OFFSET STR
       DEC SI

L2:    CMP SI, DI
       JL L4
       MOV AL, STR[SI]
       MOV BL, STR[DI]
       CMP AL, BL
       JNE L3
       DEC SI
       INC DI
       JMP L2

L3:    MOV DX, OFFSET MSG2
       MOV AH, 09H
       INT 21H
       JMP L5

L4:    MOV DX, OFFSET MSG1
       MOV AH, 09H
       INT 21H
       
L5:    MOV AH, 4CH
       INT 21H
CODE ENDS
END START
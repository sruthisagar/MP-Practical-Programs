ASSUME CS: CODE, DS: DATA

DATA SEGMENT
       STR DB "Hola Amigos"
       LEN DW $-STR
       UPPERCASE DB 1 DUP(?)
       LOWERCASE DB 1 DUP(?)
       MSG1 DB 0DH, 0AH, "No. of Uppercase letters = ","$"
       MSG2 DB 0DH, 0AH, "No. of Lowercase letters = ","$"
DATA ENDS

CODE SEGMENT
START: MOV AX, DATA
       MOV DS, AX
       MOV DL, 00
       MOV DH, 00
       LEA SI, STR
       MOV CX, LEN

L1:    MOV AL, STR [SI]
       CMP AL, "a"
       JNC L2
       CMP AL, "A"
       JNC L3
       JC L6

L2:    CMP AL, "z"
       JC L4
       JNC L6

L3:    CMP AL, "Z"
       JC L5
       JNC L6

L4:    INC DL
       JMP L6

L5:    INC DH

L6:    INC SI
       LOOP L1
       MOV UPPERCASE, DH
       MOV LOWERCASE, DL
       MOV DX, OFFSET MSG1
       MOV AH, 09H
       INT 21H
       MOV DL, UPPERCASE
       MOV AH, 02H
       MOV BL, 30H
       ADD BL, DL
       MOV DL, BL
       INT 21H
       MOV DX, OFFSET MSG2
       MOV AH, 09H
       INT 21H
       MOV DL, LOWERCASE
       MOV AH, 02H
       MOV BL, 30H
       ADD BL, DL
       MOV DL, BL
       INT 21H
       MOV AH, 4CH
       INT 21H
CODE ENDS
END START
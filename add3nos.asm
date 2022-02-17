ASSUME CS: CODE, DS: DATA
DATA SEGMENT
	NUM1 DW 1111H
	NUM2 DW 1111H
	NUM3 DW 1111H
	SUM DW 1 DUP(?)
	CARRY DW 1 DUP(?)
DATA ENDS

CODE SEGMENT
START:	MOV AX, DATA
		MOV DS, AX
		MOV CX, 0000H

		MOV AX, NUM1
		MOV BX, NUM2
		ADD AX, BX
		JNE LABEL1
		INC CX

LABEL1: MOV BX, NUM3
		ADD AX, BX
		JNC LABEL2
		INC CX

LABEL2:	MOV SUM, AX
		MOV CARRY, CX

		MOV AH, 4CH
        INT 21H
CODE ENDS
END START

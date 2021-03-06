ASSUME CS: CODE, DS: DATA
DATA SEGMENT
	DVDH DW 05F5H
	DVDL DW 0E100H
	DVR DW 2710H
	QH DW 1 DUP(?)
	QL DW 1 DUP(?)
	REM DW 1 DUP(?)
	MSG DB 0DH, 0AH, "Division by zero", "$"
DATA ENDS

CODE SEGMENT
START:	MOV AX, DATA
		MOV DS, AX

		CMP DVR, 0000H
		JZ LABEL1
		MOV AX, DVDH
		MOV DX, 0000H
		DIV DVR
		MOV QH, AX
		MOV AX, DVDL
		DIV DVR
		MOV QL, AX
		MOV REM, DX
		JMP LABEL2

LABEL1: MOV DX, OFFSET MSG
		MOV AH, 09H
        INT 21H

LABEL2:	MOV AH, 4CH
        INT 21H
CODE ENDS
END START
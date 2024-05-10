; Carga de datos en memoria
MOV [00],5d
MOV [01],5d
; Carga de datos en registros
MOV A,[00]
MOV B,[01]
; Compara los registros
CMP A,B
; Si los datos son distintos, entonces
JNE suma
HLT
; Suma de los datos
suma:
	ADD A,B
	MOV [02],A
	HLT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Otra forma de resolverlo ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Carga de datos en memoria
MOV [00],5d
MOV [01],5d
; Carga de datos en registros
MOV A,[00]
MOV B,[01]
; Compara los registros
CMP A,B
; Si los datos son iguales, entonces
JE fin
ADD A,B
MOV [02],A
HLT
; termina el programa
fin:
    HLT
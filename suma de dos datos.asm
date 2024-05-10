// ; Carga de datos en memoria
MOV [00],10d
MOV [01],5d
// ; Carga de datos en registros
MOV A,[00]
MOV B,[01]
// ; Suma de los datos
ADD A,B
MOV [02],A
// ; Reseteo el valor del registro A
MOV A,[00]
// ; Resta
SUB A,B
MOV [03],A
// ; Terminar programa
HLT


// Este código es para el simulador http://schweigi.github.io/assembler-simulator/

// En esta parte salto a la etiqueta inicio, ya que no quiero que ejecute
// el código que está en las etiquetas impar y par
JMP inicio
impar:
    DB "Impar"
    DB 0    // El cero es una condición para terminar el loop de print
par:
    DB "Par"
    DB 0
inicio:
    MOV B, 11d  // Guardo el numero que quiero ver si es par o impar en el registro B

// Mediante esta resta, lo que hago es que el numero quede en 0 o en "-1" que en el caso del simulador
// Es interpretado como 0xFF mas 1 en el carry. Mientras que 0 es interpretado como 1 en la flag Zero
resta:
    SUB B, 2d
    JA resta    // Llama a resta mientras Zero=False && Carry=False

JE es_par   // Si Zero=True, quiere decir que el numero es par, ya que al dividir por 2 el resto dió 0
            // Si es par, entonces salta a la etiqueta es_par y no ejecuta las proximas 2 lineas

MOV C, impar    // En el caso de no saltar a par, apunto con el registro C a la string impar   
JMP print       // Y salto al label print

es_par:
    MOV C, par  // Si salta a par, el registro C apunta a la string par

print:
    MOV B, 0    // Defino que el registro B sea cero para poder detener el loop de print
    MOV D,232   // En el caso del simulador, desde la posición de memoria 0xE7 hasta 0xFF
                // Se muestran en el output 
loop:
    MOV A,[C]   // Traigo el valor posicional 0 de la string apuntada en el registro C al registro A
    MOV [D], A  // Muevo la letra que guardé en el registro A a la salida
    INC C       // Incremento el índice de C en 1
    INC D       // Incremento la salida al próximo lugar
    CMP B,[C]   // Comparo 0x00 (REG B) con el valor del caracter en REG C
    JNZ loop    // Si Zero=False salta a loop, de modo que si la comparación anterior es verdad, no salta a loop
    HLT
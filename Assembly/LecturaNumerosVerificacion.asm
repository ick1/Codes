;RICARDO DOMINGUEZ OJEDA, 202325963, DO202325963@ALM.BUAP.MX

;OBJETIVO: ENTRADA ESTRANDAR Y VALIDAR DE DOS NUMEROS

LEER: 
    MOV AH, 01H                     ; SERVICIO DE LECTURA DE 1 CARACTER 
    INT 21H                         ; EN AL DEJA EL CODIGO ASCII
    
    CMP AL, 30H                     ; COMPARA A AL CON EL CARACTER 30H (0)
    JL ERROR                        ; SALTO CONDICIONAL DE MENOR QUE A ERROR 
    CMP AL, 39H                     ; COMPARA A AL CON EL CARACTER 39H (9)
    JLE RESTA30H                    ; SALTO CONDICIONAL MENOR O IGUAL QUE A RESTA30H 
    CMP AL, 41H                     ; COMPARA A AL CON EL CARACTER 41H (A)
    JL ERROR                        ; SALTO CONDICIONAL DE MENOR QUE A ERROR
    CMP AL, 46H                     ; COMPARA A AL CON EL CARACTER 46H (F)
    JLE RESTA37H                    ; SALTO CONDICIONAL MENOR O IGUAL QUE A RESTA37H    
    
ERROR:                              ; IMPRIMIR LA CADENA DE ERROR
    MOV AH, 09H                     ; SERVICIO QUE IMPRIME EN PANTALLA DE LA INT 21H                           
    MOV DX, OFFSET CADENA_ERROR     ; DETERMINAR LA DIRECCION DE CADENA_ERROR
    INT 21H
    
    JMP LEER                        ; SALTO INCONDICIONAL
                                    
RESTA30H: 
    SUB AL, 30H                     ; AL -= 30H
    MOV N1, AL                      ; N1 = AL
                                             
    JMP LEER1                       ; SALTO INCONDICIONALu
    
RESTA37H:
    SUB AL, 37H                     ; AL -= 37H
    MOV N1, AL                      ; N1 = AL
                                             
LEER1: 
    MOV AH, 01H                     ; SERVICIO DE LECTURA DE 1 CARACTER 
    INT 21H                         ; EN AL DEJA EL CODIGO ASCII
    
    CMP AL, 30H                     ; COMPARA A AL CON EL CARACTER 30H (0)
    JL ERROR1                       ; SALTO CONDICIONAL DE MENOR QUE A ERROR 
    CMP AL, 39H                     ; COMPARA A AL CON EL CARACTER 39H (9)
    JLE RESTA30H1                   ; SALTO CONDICIONAL MENOR O IGUAL QUE A RESTA30H 
    CMP AL, 41H                     ; COMPARA A AL CON EL CARACTER 41H (A)
    JL ERROR1                       ; SALTO CONDICIONAL DE MENOR QUE A ERROR
    CMP AL, 46H                     ; COMPARA A AL CON EL CARACTER 46H (F)
    JLE RESTA37H1                   ; SALTO CONDICIONAL MENOR O IGUAL QUE A RESTA37H    
    
ERROR1:                             ; IMPRIMIR LA CADENA DE ERROR
    MOV AH, 09H                     ; SERVICIO QUE IMPRIME EN PANTALLA DE LA INT 21H                           
    MOV DX, OFFSET CADENA_ERROR     ; DETERMINAR LA DIRECCION DE CADENA_ERROR
    INT 21H
    
    JMP LEER1                       ; SALTO INCONDICIONAL
                                    
RESTA30H1: 
    SUB AL, 30H                     ; AL -= 30H
    MOV N2, AL                      ; N2 = AL
    
RESTA37H1:
    SUB AL, 37H                     ; AL -= 37H
    MOV N2, AL                      ; N2 = AL               
    
    ;FIN DEL PROGRAMA
    INT 20H
    
;VARIABLES
N1              DB 00H              ; RESERVA UN BYTE Y LO INICIALIZA EN 0
N2              DB 00H                 
CADENA_ERROR    DB 20H, "ERROR DIGITO NO VALIDO", 0DH, 0AH, 24H        
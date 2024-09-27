; RICARDO DOMINGUEZ OJEDA, 202325963, DO202325963@ALM.BUAP.MX
; OBJETIVO: DETERMINAR LAS OPERACIONES MEDIANTE CARACTERES 

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
    
    JMP LEER1 
    
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
    
    JMP IMPRESION                   ; SALTO INCONDICIONAL
    
RESTA37H1:
    SUB AL, 37H                     ; AL -= 37H
    MOV N2, AL                      ; N2 = AL                   

IMPRESION: 
    MOV AH, 09H                     ; SERVICIO QUE IMPRIME EN PANTALLA DE LA INT 21H
    MOV DX, OFFSET OPERACIONES      ; DETERMINAR LA DIRECCION DE LA CADENA OPERACIONES
    INT 21H                                                                      
    
LECTURA: 
    MOV AH, 09H
    MOV DX, OFFSET ENTER            ; IMPRIMIR UN ENTER (ESTETICO)
    INT 21H
    
    MOV AH, 01H                     ; SERVICIO DE LECTURA DE UN CARACTER
    INT 21H                                                             
    
    CMP AL, 2BH                     ; COMPARA CON EL CARACTER 2BH (+)
    JE SUMA                         ; SALTO CONDICIONAL IGUAL
    CMP AL, 2DH                     ; COMPARA CON EL CARACTER 2DH (-)
    JE RESTA                        ; SALTO CONDICIONAL IGUAL
    CMP AL, 2EH                     ; COMPARA CON EL CARACTER 2EH (.)
    JE PRODUCTO                     ; SALTO CONDICIONAL IGUAL
    CMP AL, 2FH                     ; COMPARA CON EL CARACTER 2FH (/)
    JE DIVISION                     ; SALTO CONDICIONAL IGUAL    
    CMP AL, 30H                     ; COMPARA A AL CON EL CARACTER 30H (0)
    JE FIN                          ; SALTO CONDICIONAL AL FINAL
    
ERRORL: 
    MOV AH, 09H                     ; SERVICIO IMPRESION EN PANTALLA
    MOV DX, OFFSET CADENA_ERROR     ; DIRECCION DE CADENA_ERROR
    INT 21H
    
    JMP LECTURA                     ; REGRESAR A LA LECTURA DE LA OPERACION

SUMA:   
    MOV AL, N1                      ; AL = N1
    ADD AL, N2                      ; RES_SUM = RES_SUM + N2         
    MOV RES_SUM, AL                 ; RES_SUMA = N1
    
    JMP LECTURA                     ; SALTO INCONDICIONAL
    
RESTA:    
    MOV AL, N1                      ; AL = N1
    SUB AL, N2                      ; RES_RES = RES_RES - N2        
    MOV RES_RES, AL                 ; RES_RES = N1           
                
    JMP LECTURA                     ; SALTO INCONDICIONAL
           
PRODUCTO: 
    MOV AL, N1                      ; AL = N1
    MUL N2                          ; AX = AL * N2
    MOV RES_MUL, AX                 ; GUARDAR EL PRODUCTO

    JMP LECTURA                     ; SALTO INCONDICIONAL
    
DIVISION: 
    MOV AL, N1                      ; AL = N1
    DIV N2                          ; AL = AL / N2
    MOV COS_DIV, AL                 ; COS_ DIV = AL
    MOV RES_DIV, AH                 ; RES_DIV = AH, EL RESIDUO SE GUARDA EN AH
    
    JMP LECTURA                     ; SALTO INCONDICIONAL
FIN:
    ;FIN DEL PROGRAMA
    INT 20H
    

; DECLARACION DE VARIABLES 
OPERACIONES     DB 0DH, 0AH, "OPERACIONES DEL MENU: ", 2BH, 20H, 2DH, 20H, 2EH, 20H, 2FH, 0DH, 0AH, "SALIR: ", 30H, 24H 
N1              DB 00H
N2              DB 00H
CADENA_ERROR    DB " DIGITO NO VALIDO", 0DH, 0AH, 24H 
ENTER           DB 0DH, 0AH, 24H 
RES_SUM         DB 00H
RES_RES         DB 00H
RES_MUL         DW 00H
COS_DIV         DB 00H
RES_DIV         DB 00H
                        
;RICARDO DOMINGUEZ OJEDA, 202325963, DO202325963@ALM.BUAP.MX

;OBJETIVO: ENTRADA ESTANDAR

INICIO:
    MOV AH, 01H             ; SERVICIO DE LECTURA DE 1 CARACTER
    INT 21H                 ; DEJA EN AL EL CODIGO ASCII
    
    SUB AL, 30H             ; CONVERSION DE ASCII A HEX
    
    MOV BH, AL              ; GUARDA EL NUMERO EN BH
    
    ; LEER OTRO NUMERO
    MOV AH, 01H             ; SERVICIO DE LECTURA DE 1 CARACTER
    INT 21H                 ; EN AL DEJA EL CODIGO ASCII
    
    SUB AL, 30H             ; CONVERSION DE ASCII A HEX
    
    ADD BH, AL              ; SUMA DE LOS VALORES 
    
    ; FIN DEL PROGRAMA
    INT 20H
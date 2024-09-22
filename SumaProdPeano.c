//Ricardo Dominguez Ojeda, 202325963, do202325963@alm.buap.mx
#include <stdio.h>

void sumaPeanoTrazaSum(int a, int b){    //Suma de Peano, con la traza de las sumas
    if(b==0){
        printf("%d + %d = %d", a, b, a);
    }
    else{
        printf("%d + %d = %d + S(%d) = S(%d + %d)\n", a, b, a, b-1, a, b-1); 
        sumaPeanoTrazaSum(a,b-1); 
    }
}

void sumaPeanoTrazaSuc(int a, int b){    //Suma de Peano, con la traza de los sucesores
    if(b == 0){
        printf("%d",a);
    } else {
        printf("S("); 
        sumaPeanoTrazaSuc(a,b-1);
        printf(")"); 
    } 
}

void prodPeanoTrazaProd(int a, int b){    //Producto de Peano, con la traza de los productos
    if (b == 0){
        printf("%d * %d = %d", a, b, b);
    } else {
        printf("%d * %d = %d * S(%d) = %d + (%d * %d)\n", a, b, a, b-1, a, a, b-1);
        prodPeanoTrazaProd(a,b-1); 
    }
}

void prodPeanoTrazaSum(int a, int b){    //Suma de Peano, con la traza de las sumas
    if(b == 0){
        printf("%d", b);
    } else {
        printf("%d + (",a);
        prodPeanoTrazaSum(a,b-1); 
        printf(")"); 
    }
}

int sucesor(int s){
   return ++s; 
}

int sumaPeano(int a, int b){
    if(b==0){
        return a;
    }
    else { 
        return sucesor(sumaPeano(a,b-1)); 
    }
}

int productoPeano(int a, int b){
    if(b==0){
        return 0;
    }
    else{
        return sumaPeano(a, productoPeano(a,b-1));
    }
}

int main(){
    int a, b, resSuma, resProd; 
    
    printf("Digite el primer numero: ");
    scanf("%d",&a); 
    printf("Digite el segundo numero: ");
    scanf("%d",&b);

    resSuma = sumaPeano(a,b); 
    resProd = productoPeano(a,b); 

    printf("\nOperandos: \na = %d, b = %d", a, b);
    printf("\n\nSuma y producto de Peano, son trazas:\na+b = %d\na*b = %d", resSuma, resProd);
    printf("\n\nSuma de Peano, con la traza de las sumas:\n");
    sumaPeanoTrazaSum(a,b); 
    printf("\n\nSuma de Peano, con la traza de los sucesores:\n");
    sumaPeanoTrazaSuc(a,b); 
    printf(" = %d", resSuma); 
    printf("\n\n\nProducto de Peano, con la traza de los productos:\n");
    prodPeanoTrazaProd(a,b); 
    printf("\n\nProducto de Peano, con la traza de las sumas:\n");
    prodPeanoTrazaSum(a,b);
    printf(" = %d", resProd); 
}
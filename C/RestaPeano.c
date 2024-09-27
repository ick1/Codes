#include <stdio.h>

void restaPeanoTrazaResta(int a, int b){
    if(b==0){
        printf("%d - %d = %d", a, b, a);
    }
    else{
        printf("%d - %d = %d - S(%d) = S(%d - %d)\n", a, b, a, b-1, a, b-1); 
        restaPeanoTrazaResta(a,b-1); 
    }
}

void restaPeanoTrazaSuc(int a, int b){
    if(b == 0){
        printf("%d",a);
    } else {
        printf("S("); 
        restaPeanoTrazaSuc(a,b-1);
        printf(")"); 
    } 
}

int anterior(int s){
    return --s; 
}

int restaPeano(int a, int b){
    if(b==0){
        return a; 
    } else {
        return anterior(restaPeano(a, b-1)); 
    }
}

int main(){
    int a, b, restaRes; 
    
    printf("Digite el primer numero: ");
    scanf("%d",&a); 
    printf("Digite el segundo numero: ");
    scanf("%d",&b);

    restaRes = restaPeano(a,b); 

    printf("La resta de peano da como resultado: %d",restaRes);
    printf("\n\n"); 
    restaPeanoTrazaResta(b,a);
    printf("\n\n");  
    restaPeanoTrazaSuc(b,a); 

    return 0; 
}

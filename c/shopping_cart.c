#include <stdio.h>
#include <string.h>

int main() 
{
    int quantity = 0; 
    char currency ='$' ;
    float total =0.0f;
    float price =0.0f;
    char item[50];

    printf("what item would you like to buy\n");
    
    fgets(item, sizeof(item), stdin);
    item[strlen(item) -1]='\0';

    printf("how many of them would you like to buy\n ");
    scanf("%d", &quantity);
    
    printf("what is the price for each\n ");
    scanf("%f", &price);

    total = price * quantity;

    printf("\nyou have bought %d %s\n",quantity , item);
    printf("The total is %c%.2f", currency, total);


}
#include <stdio.h>

int main(){

    float yo;// format specifier is %f
    int a;//format specifier is %d
    double d;//format specifier is %lf
    char chrt;//format specifier is %c
    char str[15];//string format specifier is %s and array size has to be mentioned for string

    printf("Hello and Welcome to the form\n");
    
    printf("enter your name \n");
    scanf("%s",str);
    printf("enter your initials\n");
    scanf(" %c",&chrt);
    printf("enter your mobile number\n");
    scanf("%d",&a);
    printf("enter your percentage\n");
    scanf("%f",&yo);
    printf ("enter the value of pi\n");
    scanf("%lf",&d);

    printf("so your details are Name:%s , Initials: %c , Mobile number: %d, Percentage: %f, Value of PI: %.15lf",str,chrt,a,yo,d );

}

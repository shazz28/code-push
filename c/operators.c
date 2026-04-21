#include <stdio.h>
int main()
{
    int a = 10;
    int b = 20;
    int add, sub,mul, div, mod, z=10,x=10,y=10,w=10;

    add = a+b;
    sub = b-a;
    mul = a*b;
    div = b/a;
    mod =a%b;

    //augmented assignment operators
    z+=2;
    x-=2;
    y*=5;
    w/=2;

    printf("the addition is %d\n", add);
    printf("the subtraction is %d\n",sub);
    printf("the multiplication is %d\n",mul);
    printf("the division is %d\n",div);
    printf("the modulous is %d\n",mod);

    //output for augmented assignment operator
    printf("the addition is %d\n", z);
    printf("the subtraction is %d\n",x);
    printf("the multiplication is %d\n",y);
    printf("the division is %d\n",w);


    // \n
}
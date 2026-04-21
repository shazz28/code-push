#include <stdio.h> 
#include <math.h>
int main(){
    int x,y, z = 25;
    float a = 3.14;

    x = sqrt(z);
    printf("\n");
    y = pow(z,x);
    a = round(a);
    printf("the square root of %d is %d\n",z,x);
    printf("the power of %d is %d\n",z,y);
    printf("the round off is %f\n",a);

    
}
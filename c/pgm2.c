/* Aim: Write a C program to solve given expression. Res=a*(b+c)*d-e, read the values from the standard input device. The output should be displayed in below fashion.
 Format 1:Result = Value of expression*/

 #include <stdio.h>
 int main ()
 {
    float val[5],res;
    char yo[] ={'a','b','c','d','e'};



    for (int i = 0; i<=4; i++){
        printf("enter the marks %c ",yo[i]);
        scanf("%f",&val[i]);

    }
    res= val[0]*(val[1]+val[2])*val[3]-val[4];
    
    printf("\nResult: %.2f * (%.2f + %.2f) * %.2f - %.2f = %.2f \n",val[0],val[1],val[2],val[3],val[4],res);
    printf("the result is %.2f\n",res);
    
 }

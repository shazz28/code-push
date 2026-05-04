#include<stdio.h>
#include <stdlib.h>
int main(){
    int n = 0;
    int factorial = 1;
    printf("enter the no of books\n");
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        factorial*=i;
    }
    printf("The number of ways to arrange %d books is: %d\n", n, factorial);
    return 0;
}
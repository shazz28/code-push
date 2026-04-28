#include<stdio.h>
int main()
{
    int gross,basic,hra,da, net;
    int pt = 200,it = 10;
    printf("enter the basic salary\n");
    scanf("%d",&basic);
    printf("enter the HRA\n");
    scanf("%d",&hra);
    printf("enter the DA\n");
    scanf("%d",&da);

    gross = basic + hra + da;
    net = gross - pt -it;
    printf("The gross salary is %d\n",gross);
    printf("The net salary is %d\n",net);
}
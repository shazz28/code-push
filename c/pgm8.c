#include<stdio.h>
int main(){
    int selection;

    printf("Hello welcome to the vending machine\n");
    printf("Enter the product code\n");
    scanf("%d",&selection);
    switch (selection)
    {
    case 101 :
        printf("you have selected Wafer chips\n");
        break;
    case 201:
        printf("you have selected Snickers Choclate \n");
        break;
    case 301:
        printf("you have selected Maaza Juice\n");
        break;
    case 401:
        printf("you have selected Dairy milk Oreo\n");
        break;
    default:
        break;
    }
}
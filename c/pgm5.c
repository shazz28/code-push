#include <stdio.h>
int main(){
    int birth, current, year;
    char name[20];
    
    printf("enter your name\n");
    scanf("%s",&name);
    printf("Hello %s enter your birth year \n",name);
    scanf("%d",&birth);
    printf("enter the current year \n",name);
    scanf("%d",&current);
    year = current - birth;
    if (year>18){
        printf("Heyy,%s you are eligible to vote\n",name);
    }
    else 
        printf("Sorry %s you are not eligible to vote\n",name);


}

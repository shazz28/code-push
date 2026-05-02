#include <stdio.h>
#include <math.h>
int main(){
    int height, velocity, gravity,time;
    printf("Enter the height from which the ball is thrown: ");
    scanf("%f", &height);
    printf("Enter the velocity with which the ball is thrown: ");
    scanf("%f", &velocity);
    printf("Enter the acceleration due to gravity: ");
    scanf("%f", &gravity);
    time = (-velocity + sqrt(velocity * velocity + 2 * gravity * height)) / gravity;
    printf("Time taken by the ball to reach the ground is: %f seconds\n", time);
}

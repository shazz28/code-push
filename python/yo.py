#print ("yo world")
"""temp = 20
is_raining = False

if temp > 35 or temp < 0 or is_raining:
    print ("the event is cancelled")
else:
     print ("the event is not cancelled")"""
'''
temp = 2000
is_sunny = True

if temp >= 28 and is_sunny: 
    print ("it's hot and sunny")
elif temp <= 0 and is_sunny :
     print ("it's cold and sunny")
elif 28 > temp > 0 and is_sunny :
     print("its warm and sunny")
elif temp >= 28 and not is_sunny: 
    print ("it's hot and sunny")
elif temp <= 0 and not is_sunny :
     print ("it's cold and sunny")
elif 28 > temp > 0 and not is_sunny :
     print("its warm and sunny")
'''
'''
1
n = int(input("enter number: "))
if n%2!=0:
    print('weird')
elif n%2 ==0 :
     if 2 <= n <= 5:
          print ("not weird")
     elif 6 <= n <= 20:
          print('weird')
     elif n>20:
          print ("not weird")

2
a = int(input())
b = int(input())

print(int(a/b))
print(float(a/b))

print ("",a+b)
print ("",a-b)
print ("",a*b)

3
n = int(input())

for i in range(n):
    print(i * i)

4

'''
n = int(input())

for i in range(n):
    print (str(i + 1),end="")
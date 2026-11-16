fruit = ['apple', 'banana', 'cherry', 'date', 'fig', 'grape']
fruit[(len(fruit)//2): len(fruit)] = ['blackberry', 'blueberry', 'kiwi']
fruit[0:len(fruit):2] 
#starting indext; ending index

#list comprehension
#** does powers
#all the powers up to 10
range(0,11)
[2 **n for n in range(0,11)]
powers_of_two = []

[fruit for fruits in fruit[0:len(fruit):2]]
#how to check if even using mod %
3%2
#1
8%5
#3
13%2
#1
#if we do this w n%2 and it is 0 then it is even

#4-1
pizza = ['white', 'mushrooms', 'onion']
for p in pizza:
    print(f"{p.title()} is the best pizza.")

print(f"I like pizza.\n")
print(f"I only like a few pizzas.\n")
print(f"I perfer them to not be as acidic.\n")

#4-2
animals = ['cat', 'cheetah', 'cougar']
for a in animals:
    print(f"{a.title()} is an animal name.")
    print(f"{a.title()}s may not be a common pet.\n")
    print(f"{a.title()}s are cute.\n")
print("All of these animals have fur.")

#4-3
for twenty in range(1, 21):
 print(twenty)

#4-4
#million = list(range(1, 1000001))
#print(million)

#4-5
#million = list(range(1, 1000001))
#print(min(million))
#print(max(million))     
#print(sum(million))

#4-6
odd = [n for n in range(1, 20)][0::2]
for n in odd:
   print(n)
print(odd)

#4-7
threes = [n for n in range(0, 31)][0::3]
for n in threes:
    print(n)

#4-8
cubes = [n**3 for n in range(1, 11)]
for n in cubes:
    print(n)

#4-9
cube = [value**3 for value in range(1, 11)]
print(cube)

#4-10
print("The first three items in the list are:")
for an in animals[:3]:
    print(an.title())

print("Three items from the middle of the list are:")
for an in animals[1:4]:
    print(an.title())

print("The last three items in the list are:")
for an in animals[-3:]:
    print(an.title())

#4-11
pizza = ['white', 'mushrooms', 'onion']
friend_pizza = pizza[:]
pizza.append('loaded')
friend_pizza.append('pepperoni')

print("My favorite pizzas are:")
for p in pizza:
    print(p)
print("\nMy friend's favorite pizzas are:")
for fp in friend_pizza:
    print(fp)

#4-12 foods.py
my_foods = ['potatoes', 'cookies', 'pho']
for mf in my_foods:
    print(mf)
for mf in my_foods[1:]:
    print(mf)

#4-13
#tuples use paraenthesis instead of brackets
buffet = ('salad', 'soup', 'pasta', 'chicken tenders', 'dessert')
for food in buffet:
    print(f'This resturarnt offers ' + food + '.')
#buffet[0] = 'bread' 

#4-14 - DONE

#4-15

animals = ['cat', 
           'cheetah', 
           'cougar']
for a in animals:
    print(f"{a.title()} is an animal name.")
    print(f"{a.title()}s may not be a common pet.\n")
    print(f"{a.title()}s are cute.\n")
print("All of these animals have fur.")

pizza = ['white', 
         'mushrooms', 
         'onion']
for p in pizza:
    print(f"{p.title()} is the best pizza.")

print(f"I like pizza.\n")
print(f"I only like a few pizzas.\n")
print(f"I perfer them to not be as acidic.\n")

buffet = ('salad', 'soup', 
          'pasta', 'chicken tenders', 
          'dessert')
for food in buffet:
    print(f'This resturarnt offers ' 
          + food 
          + '.')
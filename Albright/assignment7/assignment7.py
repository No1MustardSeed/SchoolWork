#7-1
car_rental = input("What kind of car would you like to rent? ")
print("Let me see if we have a " + car_rental + " for you.")

#7-2
guests = input("How many people are in your dinner group? ")
guests = int(guests)
if guests > 8:
    print("Please wait for an available table.")
else:
    print("Your table is ready.")

#7-3
tens = input("Enter a number: ")
tens = int(tens)
if tens % 10 == 0:
    print(str(tens) + " is a multiple of 10.")  
else:
    print(str(tens) + " is not a multiple of 10.")

#7-4
prompt = "\nTell me what toppings you want"
prompt += "\nEnter 'done' to end the program. "
toppings = []
while toppings != 'done':
    toppings = input(prompt)
    if toppings != 'done':
        print(toppings + " has been added to your pizza.")
    else: 
        print("Your pizza is ready.")

#7-5
movie_age = input("Enter your age: ")
movie_age = int(movie_age)
if movie_age < 3:
    print("Your ticket is free.")
elif movie_age >= 3 and movie_age <= 12:
    print("Your ticket is $10.")
else:
    print("Your ticket is $15.")

#7-6
prompt = "\nTell me what toppings you want"
prompt += "\nEnter 'done' to end the program. "
toppings = []
while toppings != 'done':
    toppings = input(prompt)
    if toppings != 'done':
        print(toppings + " has been added to your pizza.")
    else: 
        print("Your pizza is ready.")
        break

#7-7
#x = 10
#while x <= 100:
 #print(x)

#7-8
sandwich_orders = ['rueben', 'chopped cheese', 'philly cheese steak', 'turkey', 'grilled cheese']
finished_sandwiches = []
while sandwich_orders:
    current_sandwich = sandwich_orders.pop()
    print("I made your " + current_sandwich + ".")
    finished_sandwiches.append(current_sandwich)
print("\nThe following sandwiches have been made:")
for finish in finished_sandwiches:
 print(finish)

#7-9
sandwich_orders = ['rueben', 'chopped cheese', 'philly cheese steak', 'turkey', 'pastrami', 'pastrami', 'grilled cheese', 'pastrami']
finished_sandwiches = []
print("I'm sorry, but we have run out of pastrami.\n")
while 'pastrami' in sandwich_orders:
    sandwich_orders.remove('pastrami')
while sandwich_orders:
    current_sandwich = sandwich_orders.pop()
    print("I made your " + current_sandwich + ".")
    finished_sandwiches.append(current_sandwich)
print("\nThe following sandwiches have been made:")
for finish in finished_sandwiches:
 print(finish)

#7-10
responses = {}
polling_active = True
while polling_active:
    name = input("\nWhat is your name? ")
    response  = input("If you could visit one place in the world, where would you go? ")
    responses[name] = response
    repeat = input("Would you like to let another person respond? (yes/no) ")
    if repeat == 'no':
        polling_active = False
print("\n- Poll Results -")
for name, response in responses.items():
    print(f"{name} would like to go to {response}.")
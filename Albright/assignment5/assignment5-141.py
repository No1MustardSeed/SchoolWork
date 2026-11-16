#5-1
car = ['subaru', 'honda', 'toyota', 'ford', 'audi']
car = 'subaru'#True
car == 'subaru'

car == 'honda'#False
car = 'toyota'

car = 'subaru'  #False
car == 'Subaru'

car = 'Subaru' #True
car.lower() == 'subaru'

car = 'HONDA' #True
car.lower() == 'honda'  

car = 'audi' #False
car.upper() == 'audi'

cat = 'siamese' #True
cat != 'persian'

cat = 'tortie' #False
cat != 'tortie'

cat = 'tuxedo' #True
cat != 'Tuxedo'

cat = 'Tuxedo' #False
cat.upper() != 'tuxedo'

#5-2
temp = 75
temp > 18 #True
temp <18 #False
temp != 18 #True

order = ['burger', 'fries', 'soda']
'burger' in order #True
'soft serve' in order #False
item = 'chicken tenders'
if item not in order:
    print(f"{item} is not in the order.")
item2 = 'fries'
if item2 not in order:
    print(f"{item2} is not in the order.")
items = ['burger', 'fries', 'soda', 'salad', 'milkshake']
if 'burger' in items and 'fries' in items and 'soda' in items:
    print("The order is correct.")
if 'burger' in items or 'fries' in items and 'salad' in items:
    print("The order is not correct.")
if 'milkshake' not in order:
    print("Would you like a milkshake with that?")

#5-3
ailen = 'green'
if ailen == 'green':
    print("+10")
else:
    print("miss")   

if ailen == 'yellow' or ailen == 'red':
    print("wrong color")

#5-4
alien = 'red'
if alien == 'green':
    print("+5 points.")
if alien == 'yellow' or alien == 'red':
    print("+10 points.")
else:
    print("miss")

#5-5
alien = 'yellow'
if alien == 'green':
    print("+5 points.")
elif alien == 'yellow':
    print("+10 points.")
elif alien == 'red':
    print("+10 points.")
else:
    print("miss")    

#5-6
age = input()
age = int(age)
if age < 2:
    print("The person is a baby.")
elif age >= 2 and age < 4:
    print("The person is a toddler.")
elif age >= 4 and age < 13:
    print("The person is a kid.")
elif age >= 13 and age < 20:
    print("The person is a teenager.")
elif age >= 20 and age < 65:
    print("The person is an adult.")
elif age >= 65:
    print("The person is an elder.")

#5-7
favorite_fruits = ['strawberries', 'banana', 'dates']
if 'strawberries' in favorite_fruits:
    print("You really like strawberries!")  
if 'kiwi' in favorite_fruits:
    print("You really like kiwi!")
if 'apple' not in favorite_fruits:
    print("You may not like apples.")
else:
    print("You may like apples.")

if 'pineapple' in favorite_fruits:
    print("Must like a tropical fruit")    
else:
    print("You may not like tropical fruits.")
if 'banana' in favorite_fruits:
    print("You really like bananas!")

#5-8
usernames = ['admin', 'defnotjosh', 'caius', 'no.1mustardseed', 'otter']
user = 'admin'
if user == 'admin':
    print("Hello admin, would you like to see a status report?")
else:
    for username in usernames:
        print(f"Hello {username.title()}, thank you for logging in again.")

#5-9
if usernames:
 for users in usernames:
    print(f"Hello {users}.")
    print("\nWelcome back!")
else:
    print("We need to find some users")

usernames[:] = []

if usernames:
 for users in usernames:
    print(f"Hello {users}.")
    print("\nWelcome back!")
else:
    print("We need to find some users")

#5-10
current_users = ['admin', 'defnotjosh', 'caius', 'no.1mustardseed', 'otter']
new_users = ['thanh', 'nikita', 'car1wheezer', 'no.1mustardseed', 'zaylin']

current_users_lower = [user.lower() for user in current_users]

for newuser in new_users:
    if newuser.lower() in current_users_lower:
        print(f"Sorry, the username '{newuser}' is already taken. Select a new one.")
    else:
        print(f"The username '{newuser}' is available.")

#5-11
number = list(range(1, 10))
for n in number:
    if n == 1:
        print("1st")
    elif n == 2:
        print("2nd")
    elif n == 3:
        print("3rd")
    else:
        print(f"{n}th")

#5-12 - done

#5-13
#It would be cool to make a server like discord but only for my friends
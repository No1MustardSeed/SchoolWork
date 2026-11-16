#9-1
class Resturant:
    def __init__(self, name, cuisine_type):
        self.name = name
        self.cuisine_type = cuisine_type

    def describe_resturant(self):
        print(f"{self.name} serves {self.cuisine_type} cuisine.")
    
    def open_resturant(self):
        print(f"{self.name} is open.")

my_resturant = Resturant("French Name", "French")
my_resturant.describe_resturant()
my_resturant.open_resturant()

#9-2
resturant2 = Resturant("German Name", "German")
resturant3 = Resturant("South Asian Name", "South Asian")

resturant2.describe_resturant()
resturant3.describe_resturant()

resturant2.open_resturant()
resturant3.open_resturant()

#9-3
class User:
    def __init__(self, first_name, last_name, age, job, city):
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
        self.job = job
        self.city = city
    def describe_user(self):
        print(f"User: {self.first_name} {self.last_name}\nAge: {self.age}\nJob: {self.job}\nCity: {self.city}")
    def greet_user(self):
        print(f"Hello, {self.first_name} {self.last_name}, how are you today?")

User1 = User("Mya", "Hipszer", 21, "Student", "Reading")
User2 = User("Alissa", "A", 21, "Student", "Lancaster")
User3 = User("Skye", "L", 22, "Engineer", "New York")

User1.describe_user()
User1.greet_user()

User2.describe_user()
User2.greet_user()

User3.describe_user()
User3.greet_user()

#9-4
class Resturant1:
    def __init__(self, name, cuisine_type):
        self.name = name
        self.cuisine_type = cuisine_type
        self.number_served = 0

    def describe_resturant(self):
        print(f"{self.name} serves {self.cuisine_type} cuisine.")
    
    def open_resturant(self):
        print(f"{self.name} is open.")

    def set_number_served(self):
        print(f"Number served: {self.number_served}\n")

    def update_number_served(self, additional_served):
        self.number_served += additional_served
        print(f"Updated number served: {self.number_served}\n")

my_resturant1 = Resturant1("German Name", "Germnan")
my_resturant1.describe_resturant()
my_resturant1.open_resturant()
my_resturant1.set_number_served()
my_resturant1.number_served = 25
my_resturant1.set_number_served()
my_resturant1.update_number_served(30) #for lunch
my_resturant1.update_number_served(20) #for dinner

#9-5
class User1:
    def __init__(self, first_name, last_name, age, job, city, login_attempts):
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
        self.job = job
        self.city = city
        self.login_attempts = 0
    def describe_user(self):
        print(f"User: {self.first_name} {self.last_name}\nAge: {self.age}\nJob: {self.job}/nCity: {self.city}")
    def greet_user(self):
        print(f"Hello, {self.first_name} {self.last_name}, how are you today?")
    def increment_login_attempts(self):
        self.login_attempts += 1
        print(f"Login attempts: {self.login_attempts}\n")
    def reset_login_attempts(self):
        self.login_attempts = 0
        print(f"Login attempts reset: {self.login_attempts}\n")

User1_1 = User1("Mya", "Hipszer", 21, "Student", "Reading", 0)
User1_1.increment_login_attempts()
User1_1.increment_login_attempts()
User1_1.increment_login_attempts() #attemptting login 3 times
User1_1.reset_login_attempts()
User1_1.increment_login_attempts() #attemptting login 1 time after reset

#9-6
class IceCreamStand(Resturant):
    def __init__(self, name, flavors):
        self.name = name
        self.flavors = flavors
        super().__init__(name, "dairy")
    def display_flavors(self):
        print(f"\n{self.name} offers the following flavors:")
        for flavor in self.flavors:
            print(f"- {flavor}\n")

ice_cream_stand = IceCreamStand("Ice Cream Name", ["Vanilla", "Chocolate", "Strawberry", "dairy-free"])
ice_cream_stand.describe_resturant()
ice_cream_stand.display_flavors()

#9-7
class Admin(User):
    def __init__(self, first_name, last_name, age, job, city, privileges):
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
        self.job = job
        self.city = city
        self.privileges = privileges
        super().__init__(first_name, last_name, age, job, city)
    def show_privileges(self):
        print(f"\nAdmin Privileges for {self.first_name} {self.last_name}:")
        for privilege in self.privileges:
            print(f"- {privilege}\n")

admin_user = Admin("Mya", "Hipszer", 21, "Student", "Reading",
                   ["add post", "delete post", "perma ban"]) 
admin_user.describe_user()
admin_user.show_privileges()

#9-8
class Privileges:
    def __init__(self, privileges):
        self.privileges = privileges

    def show_privileges(self):
        print(f"\nAdmin Privileges:")
        for privilege in self.privileges:
            print(f"- {privilege}\n")

#9-9
class Car:
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year
        self.odometer_reading = 0

    def get_descriptive_name(self):
        long_name = f"{self.year} {self.make} {self.model}"
        return long_name.title()

    def read_odometer(self):
        print(f"This car has {self.odometer_reading} miles on it.")

    def update_odometer(self, mileage):
        if mileage >= self.odometer_reading:
            self.odometer_reading = mileage
        else:
            print("You can't roll back an odometer!")

    def increment_odometer(self, miles):
        self.odometer_reading += miles


class Battery:
    def __init__(self, battery_size=40):
        self.battery_size = battery_size

    def describe_battery(self):
        print(f"This car has a {self.battery_size}-kWh battery.")

    def get_range(self):
        if self.battery_size == 40:
            range = 150
        elif self.battery_size == 60:
            range = 225
        elif self.battery_size == 65:
            range = 240
        print(f"This car can go about {range} miles on a full charge.")

    def upgrade_battery(self):
        if self.battery_size < 65:
            self.battery_size = 65
            print("Battery upgraded 65 kWh.")
        else:
            print("Battery is already 65 kWh or more.")


class ElectricCar(Car):
    def __init__(self, make, model, year):
        super().__init__(make, model, year)
        self.battery = Battery()

    def describe_battery(self):
        print(f"This car has a {self.battery.battery_size}-kWh battery.")

    def fill_gas_tank(self):
        print("This car doesn't need a gas tank!")



my_coolcar = ElectricCar("honda", "civic", 2020)
print(my_coolcar.get_descriptive_name())
my_coolcar.describe_battery()
my_coolcar.battery.get_range()

print("\nUpgrading another car's battery:")
car9_9 = ElectricCar("make9_9", "model9_9", 2025)
car9_9.battery.get_range()
car9_9.battery.upgrade_battery()
car9_9.battery.get_range()

#9-10
from resturant import Resturant

my_resturant_9_10 = Resturant("Italian Name", "Italian")
my_resturant_9_10.describe_resturant()
my_resturant_9_10.open_resturant()

#9-11
from user import User, Admin

admin_user_9_11 = Admin("Mya", "Hipszer", 21, "Manager", "Reading", ["ban user", "add user", "restrict user"])
admin_user_9_11.show_privileges()

#9-12
from adminprivleges import Admin
admin_user_9_12 = Admin("Alissa", "A", 21, "Manager", "Lancaster", ["add post", "delete post", "ban user"])
admin_user_9_12.show_privileges()

#9-13
class Die:
    import random
    def __init__(self, sides=6):
        self.sides = sides

    def roll_die(self):
        return self.random.randint(1, self.sides)

die6 = Die()
print("\nRolling a 6-sided die 10 times:")
for _ in range(10):
    print(die6.roll_die())

die10 = Die(sides=10)
print("\nRolling a 10-sided die 10 times:")
for _ in range(10):
    print(die10.roll_die())

d20 = Die(sides=20)
print("\nRolling a 20-sided die 10 times:")
for _ in range(10):
    print(d20.roll_die())

#9-14
lottery_numbers = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, "m", "y", "a", "h", "i"]
import random
print("\nwinning ticket:")
winning_ticket = random.sample(lottery_numbers, 4)
print(winning_ticket)
print("if your ticket matches the winning ticket, you win!")

#9-15
my_ticket = random.sample(lottery_numbers, 4)
print("\nmy ticket:")
print(my_ticket)
tries = 0

if my_ticket == winning_ticket:
    print("Congratulations! You have the winning ticket!")
else:
    while my_ticket != winning_ticket:
        my_ticket = random.sample(lottery_numbers, 4)
        tries += 1
    print(f"Congratulations! You have the winning ticket! It took {tries} tries to win.")
    #122855
    #27662
    #22503

#9-16

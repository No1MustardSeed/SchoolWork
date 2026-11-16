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

class Privileges:
    def __init__(self, privileges):
        self.privileges = privileges

    def show_privileges(self):
        print(f"\nAdmin Privileges:")
        for privilege in self.privileges:
            print(f"- {privilege}\n")

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


from user1 import User

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
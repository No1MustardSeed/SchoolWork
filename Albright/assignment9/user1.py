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
class Resturant:
    def __init__(self, name, cuisine_type):
        self.name = name
        self.cuisine_type = cuisine_type

    def describe_resturant(self):
        print(f"{self.name} serves {self.cuisine_type} cuisine.")
    
    def open_resturant(self):
        print(f"{self.name} is open.")

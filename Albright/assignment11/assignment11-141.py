#11-1
def test_city_functions(city, country):
    return f"{city.title()}, {country.title()}"
print(test_city_functions("santiago", "chile"))
print(test_city_functions("paris", "france"))

#11-2
def city_country(city, country, population=None):
    if population:
        return f"{city.title()}, {country.title()} - Population {population}"
    else:
        return f"{city.title()}, {country.title()}"

print(city_country("santiago", "chile", 5000000))

#11-3
class Employee:
    def __init__(self, first_name, last_name, salary):
        self.first_name = first_name
        self.last_name = last_name
        self.salary = salary

    def give_raise(self, amount=5000):
        self.salary += amount


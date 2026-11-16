#6-1
person = {
    'first_name': 'Alissa',
    'last_name': 'A',
    'age': 21,
    'city': 'Lancaster',
    }
print(person['first_name'])
print(person['last_name'])
print(person['age'])
print(person['city'])

#6-2
fav_num = {
    'Alissa': 67,
    'Mya': 8,
    'Skye': 39,
    'Bryan': 8,
    'Thanh': 10,
}

for name, number in fav_num.items():
    print(f"{name}'s favorite number is {number}")

#6-3
glossary = {
    'list': 'A collection which is ordered and changeable. Allows duplicate members.',
    'tuple': 'A collection which is ordered and unchangeable. Allows duplicate members.',
    '\n': 'Starts a new line.',
    'strings': 'A sequence of characters.',
    }

for definition in range(len(glossary)):
    print(f"{list(glossary.keys())[definition]}: {list(glossary.values())[definition]}\n")

#6-4
for word, definition in glossary.items():
    print(f"{word}: {definition}\n")

glossary['variable'] = 'A location to store values.'
glossary['dictionary'] = 'A collection of key-value pairs.'
glossary['PEP8'] = 'Python Enhancement Proposal - a style guide for Python code.'
glossary['comment'] = 'A note in a program that the Python interpreter ignores.'
glossary['conditional test'] = 'A statement that evaluates something as true or false.'

for word, definition in glossary.items():
    print(f"{word}: {definition}\n")

#6-5
rivers = {
    'nile': 'egypt',
    'amazon': 'brazil',
    'mississippi': 'united states',
    }
for river, country in rivers.items():
    print(f"The {river.title()} River runs through {country.title()}.")

for river in rivers.keys():
    print(river.title())
for country in rivers.values():
    print(country.title())    

#6-6
favorite_languages = {
 'jen': 'python',
 'sarah': 'c',
 'edward': 'rust',
 'phil': 'python',
 }

poll = ['jen', 'sarah', 'alissa', 'bryan', 'thanh']

for name in poll:
    if name in favorite_languages.keys():
        print(f"Thank you for taking the poll, {name.title()}!")
    else:
        print(f"{name.title()}, take our poll!")

#6-7
person = {
    'first_name': 'Alissa',
    'last_name': 'A',
    'age': 21,
    'city': 'Lancaster',
    }

person2 = {
    'first_name': 'Mya',
    'last_name': 'H',
    'age': 21,
    'city': 'Reading',
    }

person3 = {
    'first_name': 'Skye',
    'last_name': 'L',
    'age': 22,
    'city': 'Philly',
    }

people = [person, person2, person3]
for person in people:
    for key, value in person.items():
        print(f"{key}: {value}")
    print("\n")

#6-8
pets = {
    'ahri': {
        'animal': 'cat',
        'owner': 'mya', },
    'doombringer': {
        'animal': 'cat',
        'owner': 'mya', },
    'reyna': {
        'animal': 'cat',
        'owner': 'alissa', },
    'happy': {
        'animal': 'cat',
        'owner': 'mya', },
    'nash': {
        'animal': 'dog',
        'owner': 'alissa', },
    }

for pet, pet_info in pets.items():
    print(f"Pet Name: {pet}")
    for key, value in pet_info.items():
        print(f"{key.title()}: {value.title()}")
    print("\n")

#6-9
fav_places = {
    'alissa': ['devon', 'italy', 'iceland'],
    'mya': ['iceland', 'chongqing'],
    'skye': ['seoul'],
}

for name, places in fav_places.items():
    print(f"{name.title()}'s favorite places are:")
    for place in places:
        print(f" - {place.title()}")
    print()

#6-10
fav_num = {
    'Alissa': [67, 3, 21],
    'Mya': [8, 12],
    'Skye': [39, 19],
    'Bryan': [8, 14, 42],
    'Thanh': [10],
}

for name, numbers in fav_num.items():
    print(f"{name}'s favorite numbers are:")
    for nums in numbers:
        print(f" - {nums}")
    print()

#6-11
cities = {
    'philadelphia' :
        {'country': 'usa',
         'population': 1500000,
         'fact': 'eagles',},
    'lancaster' :
        {'country': 'usa',
         'population': 60000,
         'fact': 'largest buffet',},
    'reading' :
        {'country': 'usa',
         'population': 96000,
         'fact': 'really good asian market on 8th',},  
}

for city, info in cities.items():
    print(f"\nCity: {city.title()}")
    for key, value in info.items():
        print(f"{key.title()}: {value}")
    print()

#6-12
##using 6-8
pets = {
    'ahri': {
        'animal': 'cat',
        'owner': 'mya', },
    'doombringer': {
        'animal': 'cat',
        'owner': 'mya', },
    'reyna': {
        'animal': 'cat',
        'owner': 'alissa', },
    'happy': {
        'animal': 'cat',
        'owner': 'mya', },
    'nash': {
        'animal': 'dog',
        'owner': 'alissa', },
    }

pets['ahri']['age'] = 12
pets['doombringer']['age'] = 0.5
pets['reyna']['age'] = 2
pets['happy']['age'] = 9
pets['nash']['age'] = 2

for pet, pet_info in pets.items():
    print(f"Pet Name: {pet}")
    for key, value in pet_info.items():
        print(f"{key.title()}: {str(value).title()}")
    print("\n")
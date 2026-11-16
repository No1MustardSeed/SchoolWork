#10-1
from pathlib import Path

path = Path('assignment10/learning_python.txt')
contents = path.read_text()
print(contents)

lines = contents.splitlines()
for line in lines:
    print(line)

#10-2
print(contents.replace('Python', 'C'))

#10-3
for line in contents.splitlines():
    print(line)

#10-4
path = Path('assignment10/guest_list.txt')
path.write_text("Guest List:\n" + input("Enter guest name"))

#10-5
guest_list = "Guest List:\n"

while True:
    name = input("Enter guest name (type 'stop' when all of the names are recorded): ")
    if name.lower() == "stop":
        break
    guest_list += name + "\n"

path.write_text(guest_list)

#10-6
print("Give me two numbers to add.")
print("Enter 'q' to quit.")
while True:
    first_number = input("\nFirst number: ")
    if first_number == 'q':
       break
    second_number = input("Second number: ")
    if second_number == 'q':
        break
    try:
        answer = int(first_number) + int(second_number)
    except ValueError:
        print("You must enter numbers only. Please try again.")
        continue
    else:
        print(answer)

#10-7
#I think I already did that

#10-8
cat = Path('assignment10/cat.txt')
dog = Path('assignment10/dog.txt')
    #to test, I deleted dog, then ran the code with line 58
    #without assignment10, then fixed it so it works again

cat.write_text("Happy\nAhri\nDoombringer")
dog.write_text("Tessa\nNash\nBella")

filenames = ['assignment10/cat.txt', 'assignment10/dog.txt']
for filename in filenames:
    catdog = Path(filename)
    try:
        contents = catdog.read_text()
    except FileNotFoundError:
        print(f"Sorry, the file {filename} does not exist.")
    else:
        print(f"\n{filename} contents:")
        print(contents)

#10-9
for filename in filenames:
    catdog = Path(filename)
    try:
        contents = catdog.read_text()
    except FileNotFoundError:
        pass
    else:
        print(f"\n{filename} contents:")
        print(contents)

#10-10
brothers = Path('assignment10/FD.txt')
crime = Path('assignment10/CrimePunishmentFD.txt')

def count_words(path):
    try:
        contents = path.read_text(encoding='utf-8')
    except FileNotFoundError:
        print(f"Sorry, the file {path} does not exist.")
    else:
        lower_contents = contents.lower()

        num_the = lower_contents.count('the')
        num_the_space = lower_contents.count('the ')

        print(f"\nFile: {path.name}")
        print(f"Approximate occurrences of 'the': {num_the}")
        print(f"Occurrences of 'the ' (more accurate count): {num_the_space}")

count_words(brothers)
count_words(crime)

#10-11
import json

favorite_number = input("What is your favorite number? ")
numberpath = Path('assignment10/favorite_number.json')
numberpath.write_text(json.dumps(favorite_number))

if numberpath.exists():
    favorite_number = json.loads(numberpath.read_text())
    print(f"I know your favorite number! It’s {favorite_number}.")
else:
    print("I don’t know your favorite number yet.")

#10-12

if numberpath.exists():
    favorite_number = json.loads(numberpath.read_text())
    print(f"I know your favorite number! It’s {favorite_number}.")
else:
    favorite_number = input("What is your favorite number? ")
    numberpath.write_text(json.dumps(favorite_number))
    print("I'll remember")

# 10-13 + 10-14 
def get_stored_users(path):
    if path.exists():
        try:
            contents = path.read_text()
            users = json.loads(contents)
            if isinstance(users, dict):
                users = [users]
            return users
        except json.JSONDecodeError:
            return []
    return []


def get_new_user(path):
    name = input("What is your name? ")
    age = input("How old are you? ")
    color = input("What is your favorite color? ")

    user_info = {
        "name": name,
        "age": age,
        "favorite_color": color
    }

    users = get_stored_users(path)
    users.append(user_info)
    path.write_text(json.dumps(users, indent=2))
    return user_info


def greet_user():
    path = Path("user_info.json")
    users = get_stored_users(path)

    if users:
        print("Users on file:")
        for u in users:
            print(f" - {u['name']}")
        name = input("\nWho are you? ")

        found_user = next((u for u in users if u['name'].lower() == name.lower()), None)

        if found_user:
            print(f"Welcome back, {found_user['name']}!")
            print(f"I remember that you are {found_user['age']} years old and love {found_user['favorite_color']}.")
            
            answer = input("Is this info correct? (y/n): ")
            if answer.lower() == "n":
                print("Please update your information.")
                users.remove(found_user)
                new_user = get_new_user(path)
                print(f"I will remeber you, {new_user['name']}!")
            elif answer.lower() != "y":
                print("Invalid input. Please enter 'y' or 'n'.")
        else:
            print("I do not remember you, let me add you")
            get_new_user(path)
    else:
        print("There are no users.")
        get_new_user(path)


greet_user()

names = ["Alissa", "Mya", "Skye", "Bryan", "Thanh"]
salary = [67, 8, 39, 8, 10]
age = [21, 20, 20, 21, 20]

for i in range(len(names)):
    print(f"Name: {names[i]}, Salary: {salary[i]}, Age: {age[i]}")

employees = {
    'Alissa': {'salary': 67, 'age': 21},
    'Mya': {'salary': 8, 'age': 20},
    'Skye': {'salary': 39, 'age': 20},
    'Bryan': {'salary': 8, 'age': 21},
    'Thanh': {'salary': 10, 'age': 20},
    }


#______.lower().strip() strip takes off

keypads = {
    '1': ['1'],
    '2': ['a', 'b', 'c',],
    '3': ['d', 'e', 'f',],
    '4': ['g', 'h', 'i',],
    '5': ['j', 'k', 'l',],
    '6': ['m', 'n', 'o',],
    '7': ['p', 'q', 'r', 's',],
    '8': ['t', 'u', 'v',],
    '9': ['w', 'x', 'y', 'z',],
    '0': ['0']}

phone_number = "8675309"
for digit in phone_number:
   print(digit)
   print(keypads[digit])
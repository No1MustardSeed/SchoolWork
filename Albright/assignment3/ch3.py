bicycles = ['trek', 'cannondale', 'redline', 'specialized']
print("my bike is a " + bicycles[0].title() + ".")

averages = [9.5, 8.8, 7.6, 6.4, 5.2]
names = ['mary', 'joe', 'john', 'alissa', 'skye']
print(names[0])

for i in range(len(names)):
    print(names[i])
    print(averages[i])

import random
answers = ['yes', 'no', 'maybe', 'unlikely', 'perhaps']
print("what do you want to know?")
question = input()
answer =random.choice(answers)
print(answer)

#cannot compare string to an int

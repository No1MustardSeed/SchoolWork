#class thing

print("Are you providing celsius (C) or  fareignheit(F) ?")
scale = input()
if scale == 'C' or scale == 'c':
    print("How many degrees?")
    degrees = input()
    degrees = int(degrees)
else:
    print("How many degrees?")
    degrees = input()
    degrees = int(degrees)
    degrees = (degrees - 32) * 5 / 9
print("The temperature is " + str(degrees) + " degrees Celsius.")

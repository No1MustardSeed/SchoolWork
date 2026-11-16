#3-1
names = ['mya', 'alissa', 'skye', 'kathy', 'myk']

#3-2
for n in names:
    print("Hello " + n.title() + ", how are you?")  
#3-3
trans = ['car', 'bike', 'horse', 'boat', 'walk']
for t in trans:
    print("I like traveling by " + t + " the best.")

#3-4
guest = ['mom', 'alissa', 'skye']
for g in guest:
    print("Hello " + g.title() + ", you are invited to dinner.")

#3-5
print("My guest, " + guest[2] + " cannot join me for dinner.")
del guest[2]
guest.append('dad')
for g in guest:
    print("Hello " + g.title() + ", you are invited to my dinner.")

#3-6
for g in guest:
    print("Good news, " + g.title() + "! I found a bigger dinner table, so more people are invited.")
guest.insert(0, 'kathy')
guest.insert(2, 'myk')
guest.append('bryan')
for g in guest:
    print("Hello " + g.title() + ", you are invited to my dinner party.")

#3-9
print("I am inviting " + str(len(guest)) + " people to dinner.")

#3-7
print("I apologize but I can only invite two people for dinner.")
while len(guest) > 2:
    removed_guest = guest.pop()
    print("Sorry " + removed_guest.title() + ", I cannot invite you to dinner.")

for g in guest:
    print("You are still invited to dinner, " + g.title() + ".")
del guest[0]
del guest[0]
print(guest)


#3-8
places = ['china', 'greece', 'iceland', 'yemen', 'morocco']
print(places)
print(sorted(places))
print(places)
places.reverse()
print(places)   
places.reverse()
print(places)
places.sort
print(places)
places.sort(reverse=True)
print(places)

#3-10
food = ['cake', 'sushi', 'icecream', 'pasta', 'potatoes']
for f in food:
    print("I like to eat " + f + " with my meal.")

fmessage310 = f"My favorite food is {food[0].title()}."
print(fmessage310)

food[0] = 'chocolate'

food.append('cake')
food.insert(3, 'burger')
del food[4]
popped_food = food.pop(2)
too_acidic = 'burger'
food.remove(too_acidic)

food.sort()
food.sort(reverse=True) 
food.reverse()
food.reverse()
len(food)

#3-11
print(food[6])
     #Traceback (most recent call last):
  #File "c:\Users\Mya H\OneDrive\Desktop\csc141\assignment3\assignment3-141.py", line 87, in <module>
    #print(food[6])
          #~~~~^^^
#IndexError: list index out of range
#PS C:\Users\Mya H\OneDrive\Desktop\csc141>  






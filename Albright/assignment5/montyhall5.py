from random import randint

doors = [False, False, True]
prize_door = randint(0, 2)
guess_door = randint(0, 2)
print(f"Prize door: {prize_door} and the Guess door: {guess_door}")

takeaway_door = randint(0, 2)
while takeaway_door == prize_door or takeaway_door == guess_door:
    takeaway_door = randint(0, 2)

del doors[takeaway_door]
del doors[guess_door]
guess_door = doors[0]

print(f"The the final guess door is {guess_door}")

if guess_door == prize_door:
    print("You win!")
#word guessing game
import random
word = "PYTHON"

scrambled = ["_" for letter in word]
print(scrambled)
print("".join(scrambled))

while "".join(scrambled) != word:
    print("Guess a letter.")
    guess = input()
    guess = guess.upper()
    if guess in word:
        index = 0
        for letter in word:
            if letter == guess:
                scrambled[index] = letter
            index += 1    
    else:
        print("Not in word.")    
    print("".join(scrambled))
  

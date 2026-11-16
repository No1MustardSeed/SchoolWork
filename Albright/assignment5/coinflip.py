#flip a coin 1000x and count heads and tails
import random

coin = ['H', 'T']
heads = 0
tails = 0
longest_streak = 0
current_streak = 0    
last_flip = -1
for i in range(1000):
    flip = random.choice(coin)
    if flip == 'H':
        heads += 1
    else:
        tails += 1  
    if flip == last_flip:
        current_streak += 1
print(f"Heads: {heads}, Tails: {tails}")

print("rate of heads:", heads/1000*100, "%")
print("longest streak:", current_streak)
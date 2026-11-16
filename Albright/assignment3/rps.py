import random

response = ['rock', 'paper', 'scissors']
computer_answer = random.choice(response)
print ('do you want to play rock, paper, or scissors?')
human_answer = input()
human_answer = human_answer.lower()

if human_answer not in response:
    print('invalid response, please choose rock, paper, or scissors')
    exit()

print(f'computer played {computer_answer}')

if computer_answer == human_answer:
    print ('tie!')
elif (computer_answer == 'rock' and human_answer == 'scissors') or (computer_answer == 'scissors' and human_answer == 'paper') or (computer_answer == 'paper' and human_answer == 'rock'):
    compwins += 1
    print ('computer wins!')
else:
    humanwins += 1
    print ('you win!')
compwins = 0
humanwins = 0

    


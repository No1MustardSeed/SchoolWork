import random

span = ['perro', 'gato', 'pollo']
eng = ['dog', 'cat', 'chicken']
for i in range(len(span)):
    print(span[i])
    print('what is this word in English?')
    answer = input()
    if answer == eng[i]:
        print('Correct!')
    else:
        print('Wrong! The correct answer is', eng[i])    

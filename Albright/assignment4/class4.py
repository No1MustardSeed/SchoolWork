#AWrite a program that can genreate the even numbers from 2 to 20 using list comprehension
range(2, 21, 2)
even_numbers = [num for num in range(2, 21, 2)]
print(even_numbers)

evens = [n for n in range(2, 21)][0::2]
evens = [n for n in range(2, 21)[0::2]]
evens = [n for n in range(2, 21)[0:19:2]]

even = [n * 2 for n in range(1, 11)
        ]
ev = [n if n % 2 == 0 else 0 for n in range (2, 21)]

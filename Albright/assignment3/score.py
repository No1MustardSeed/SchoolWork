runs = [1, 0, 4, 6, 3, 5, 2]
highest = runs[0]
for score in runs:
    print(score)
    if score > highest:
        highest = score
print("the highest score found:")
print(highest)
print(max(runs))
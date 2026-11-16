#8-1
def  display_message():
    print("I am learning how to write functions in python")
display_message()

#8-2
def favorite_book(title):
    print(f"One of my favorite books is {title.title()}.")
favorite_book("The Brothers Karamazov")

#8-3
def makeshirt(size, text):
    print(f"\nSize: {size}")
    print(f'T-shirt text: "{text}"')    
makeshirt('medium', 'python')

makeshirt(text='Miku', size='small')

#8-4 
def makeshirt(text, size='large'):
    print(f"\nSize: {size}")
    print(f'T-shirt text: "{text}"')   

makeshirt('I love Python')
makeshirt(size='medium', text='I Love Python')
makeshirt(text='Miku', size='small')

#8-5
def describe_city(city, country='USA'):
    print(f"\n{city.title()} is in {country}.")

describe_city('New York')
describe_city('Philly')
describe_city('chongqing', 'China')

#8-6
def city_country(city, country):
    return f'"{city.title()}, {country.title()}"'

print(city_country('santiago', 'chile'))
print(city_country('beijing', 'china'))
print(city_country('Philly', 'united states'))

#8-7
def make_album(artist, title):
    album = {'artist': artist, 'title': title}
    return album

album1 = make_album('Escape The Fate', 'Dying Is Your Latest Fashion')
album2 = make_album('Pierce The Veil', 'Flair for the Dramatic')
print(album1)
print(album2)

def make_album(artist, title, tracks=None):
    album = {'artist': artist, 'title': title}
    if tracks:
        album = {'artist': artist, 'title': title, 'tracks': tracks}
    else:
        album = {'artist': artist, 'title': title}
    return album

album1 = make_album('Escape The Fate', 'Dying Is Your Latest Fashion', '12')
album2 = make_album('Pierce The Veil', 'Flair for the Dramatic')
print(album1)
print(album2)

#8-8
def make_album(artist, title, tracks=None):
    album = {'artist': artist, 'title': title}
    if tracks:
        album = {'artist': artist, 'title': title, 'tracks': tracks}
    else:
        album = {'artist': artist, 'title': title}
    return album
#while True:
#   print("\nEnter 'q' at any time to quit. Record an album")
#    artist = input("Artist: ")
#    if artist.lower() == 'q':
#        break
#    title = input("Album title: ")
#    if title.lower() == 'q':
#        break
#    tracks = input("Number of tracks (optional): ")
#    if tracks.lower() == 'q':
#        break
#    if tracks:
#        album = make_album(artist, title.title(), tracks)
#   else:
#        album = make_album(artist, title.title())
#   print(f"\n{album}")

#8-9
def show_messages(messages):
    for message in messages:
        print(message)

messages = ["Defoko is my favorite Vocaloid.", "I think about Valorant too much.", "I play too much Valorant"]
show_messages(messages)

#8-10
def send_messages(new_messages, sent_messages):
    while messages:
        if new_messages:
            current_message = new_messages.pop()
            print(f"\nSending message: {current_message}")
            sent_messages.append(current_message)
        else:
            break

def show_messages(sent_messages):
    print("\nThe following messages have been sent:")
    for message in sent_messages:
        print(message)

new_messages = ["Defoko is my favorite Vocaloid.", "I think about Valorant too much.", "I play too much Valorant"]
sent_messages = []

send_messages(new_messages, sent_messages)
show_messages(sent_messages)

#8-11
def send_messages(new_messages, sent_messages):
    while messages:
        if new_messages:
            current_message = new_messages.pop()
            print(f"\nSending message: {current_message}")
            sent_messages.append(current_message)
        else:
            break

def show_messages(sent_messages):
    print("\nThe following messages have been sent:")
    for message in sent_messages:
        print(message)

new_messages = ["Defoko is my favorite Vocaloid.", "I think about Valorant too much.", "I play too much Valorant"]
sent_messages = []

send_messages(new_messages[:], sent_messages)
show_messages(sent_messages)

print("\nOriginal list of messages:")
for message in new_messages:
    print(message)

#8-12
def make_sandwich(*ingredients):
    print("\nMaking a sandwich with the following ingredients:")
    for ingredient in ingredients:
        print(f"- {ingredient}")

make_sandwich("cheese", "tukey", "mayo")
make_sandwich("lettuce", "tomato", "bacon", "avocado", "onion")
make_sandwich("peanut butter", "jelly")

#8-13
def build_profile(first, last, **user_info):
    user_info['first_name'] = first
    user_info['last_name'] = last
    return user_info
user_profile = build_profile('mya', 'hipszer',
                            location='reading',
                            major='political science',
                            age='21')
print(user_profile)

#8-14
def make_car(manufacturer, model, **car_info):
    car_info['manufacturer'] = manufacturer
    car_info['model'] = model
    return car_info

car = make_car('subaru', 'outback', color='blue', tow_package=True)
print(car)
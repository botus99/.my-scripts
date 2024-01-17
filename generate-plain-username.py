import random

def generate_username():

    # Establish the words to use for randomizing (my word choices are taken heavily from the various codenames in the Metal Gear Solid series)
    verbs = ['Censored', 'Climbing', 'Coding', 'Crawling', 'Decoding', 'Escaped', 'Evaded', 'Exfiltrating', 'Falling', 'Flying', 'Hacking', 'Hiding', 'Infiltrating', 'Interrogating', 'Jumping', 'Laughing', 'Obscured', 'Naked', 'Raging', 'Rescued', 'Rising', 'Running', 'Screaming', 'Sleeping', 'Sneaking', 'Spotted', 'Swimming', 'Uncensored']
    nouns = ['Aardvark', 'Alligator', 'Alpaca', 'Armadillo', 'Baboon', 'Badger', 'Bat', 'Bear', 'Beatle', 'Bison', 'Box', 'Buffalo', 'Butterfly', 'Camel', 'Cat', 'Centipede', 'Chicken', 'Cicada', 'Cobra', 'Cow', 'Crab', 'Crocodile', 'Crow', 'Cyborg', 'Deer', 'Dingo', 'Dolphin', 'Donkey', 'Eagle', 'Eel', 'Elephant', 'Falcon', 'Fox', 'Frog', 'Gerbil', 'Goat', 'Goldfish', 'Goose', 'Gorilla', 'Hawk', 'Hippo', 'Hound', 'Hyena', 'Iguana', 'Jackal', 'Jaguar', 'Koala', 'Leopard', 'Leech', 'Lion', 'Lizard', 'Llama', 'Lobster', 'Mammoth', 'Mantis', 'Mongoose', 'Mouse', 'Mule', 'Ninja', 'Octopus', 'Ocelot', 'Orca', 'Ostrich', 'Owl', 'Panda', 'Panther', 'Pelican', 'Penguin', 'Pigeon', 'Piranha', 'Puma', 'Rabbit', 'Rat', 'Raven', 'Rising', 'Scorpion', 'Seagull', 'Shark', 'Skunk', 'Sloth', 'Snake', 'Sparrow', 'Spider', 'Squirrel', 'Tarantula', 'Tiger', 'Toad', 'Turkey', 'Viper', 'Vulture', 'Walrus', 'Warthog', 'Whale', 'Wolf', 'Wasp', 'Zebra']

    # Randomly choose a verb and a noun
    verb = random.choice(verbs)
    noun = random.choice(nouns)

    # Generate a random 2-digit number (I set first number to 2100 to avoid using existing/soon-to-be-existing years)
    number = random.randint(2100, 9999)

    # Combine the components into a more readable and standardized username
    username = f'{verb}{noun}-{number}'

    return username

# Generate and print a username
generated_username = generate_username()
print(generated_username)

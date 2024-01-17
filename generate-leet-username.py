import random

def generate_username():

    # Establish the words to use for randomizing (my word choices are taken heavily from the various codenames in the Metal Gear Solid series)
    leet_verbs = ['C3nsor3d', 'Climb1ng', 'Cod1ng', 'Cr4wl1ng', 'D3cod1ng', '3scap3d', '3vad3d', 'Exf1ltrat1ng', 'Fall1ng', 'Fly1ng', 'H4ck1ng', 'H1d1ng', '1nfiltrat1ng', '1nt3rr0gat1ng', 'Jump1ng', 'Laugh1ng', '0bscur3d', 'Nak3d', 'Rag1ng', 'R3scu3d', 'R1s1ng', 'Runn1ng', 'Scr34m1ng', 'Sl33p1ng', 'Sn34k1ng', 'Sp0tt3d', 'Sw1mm1ng', 'Unc3nsor3d']
    leet_nouns = ['Aardvark', 'Alligat0r', 'Alpac4', 'Arm4dillo', 'Bab00n', 'Badg3r', 'Bat', 'B3ar', 'B34tl3', 'Bison', 'B0x', 'Buffal0', 'Butt3rfly', 'Cam3l', 'Cat', 'C3ntip3d3', 'Chick3n', 'Cicada', 'Cobra', 'C0w', 'Crab', 'Cr0c0dil3', 'Cr0w', 'Cyb0rg', 'D33r', 'D1ng0', 'D0lphin', 'D0nk3y', '3agl3', 'E3l', 'El3phant', 'Falc0n', 'F0x', 'Fr0g', 'G3rbil', 'G04t', 'G0ldf1sh', 'G00s3', 'G0rilla', 'Hawk', 'H1pp0', 'H0und', 'Hy3na', 'Iguana', 'Jackal', 'Jagu4r', 'K0ala', 'L30pard', 'L33ch', 'L10n', 'L1zard', 'Llama', 'L0bster', 'Mammoth', 'Mantis', 'Mongoose', 'Mous3', 'Mul3', 'N1nja', '0ct0pus', '0c3l0t', '0rca', '0str1ch', '0wl', 'Panda', 'Panther', 'P3lican', 'P3nguin', 'Pig30n', 'Piranha', 'Puma', 'Rabbit', 'Rat', 'Rav3n', 'R1s1ng', 'Sc0rpion', 'S3agull', 'Shark', 'Skunk', 'Sl0th', 'Snake', 'Sparr0w', 'Spid3r', 'Squirrel', 'Tarantula', 'Tig3r', 'T04d', 'Turk3y', 'Vip3r', 'Vultur3', 'Walrus', 'Warthog', 'Whal3', 'W0lf', 'Wasp', 'Z3bra']

    # Randomly choose a verb and a noun
    verb = random.choice(leet_verbs)
    noun = random.choice(leet_nouns)

    # Generate a random 2-digit number (I set first number to 2100 to avoid using existing/soon-to-be-existing years)
    number = random.randint(2100, 9999)

    # Combine the components into a more readable and standardized username
    username = f'{verb}{noun}-{number}'

    return username

# Generate and print a username
generated_username = generate_username()
print(generated_username)

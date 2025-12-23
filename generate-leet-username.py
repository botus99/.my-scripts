#!/usr/bin/env python3
import random

def generate_username():

    # Establish words to use (mostly various codenames from the Metal Gear Solid series)
    leet_verbs = ['C3n$or3d', 'Climb1ng', 'C0d1ng', 'Cr4wl1ng', 'D3c0d1ng', '3$cap3d', '3vad3d', 'Exf1ltrat1ng', 'F@ll1ng', 'Fly1ng', 'H4ck1ng', 'H1d1ng', '1nf1ltr@t1ng', '1nt3rr0g@t1ng', 'Jump1ng', 'L@ugh1ng', '0b$cur3d', 'N@k3d', 'R@g1ng', 'R3$cu3d', 'R1s1ng', 'Runn1ng', 'Scr34m1ng', 'Sl33p1ng', 'Sn34k1ng', 'Sp0tt3d', 'Sw1mm1ng', 'Unc3n$or3d']
    leet_nouns = ['A@rdv@rk', 'Allig@t0r', 'Alp@c4', '@rm@dill0', 'B@b00n', 'B@dg3r', 'B@t', 'B3@r', 'B34tl3', 'Bison', 'B0x', 'Buff@l0', 'Butt3rfly', 'C@m3l', 'C@t', 'C3ntip3d3', 'Chick3n', 'Cic@d@', 'Cobr@', 'C0w', 'Cr@b', 'Cr0c0dil3', 'Cr0w', 'Cyb0rg', 'D33r', 'D1ng0', 'D0lphin', 'D0nk3y', '3@gl3', 'E3l', 'El3ph@nt', 'F@lc0n', 'F0x', 'Fr0g', 'G3rbil', 'G04t', 'G0ldf1sh', 'G00s3', 'G0rilla', 'H@wk', 'H1pp0', 'H0und', 'Hy3n@', 'Igu@n@', 'J@ck@l', 'J@gu4r', 'K0@l@', 'L30p@rd', 'L33ch', 'L10n', 'L1z@rd', 'Ll@m@', 'L0bst3r', 'M@mmoth', 'M@ntis', 'Mong00se', 'Mous3', 'Mul3', 'N1nj@', '0ct0pus', '0c3l0t', '0rc@', '0str1ch', '0wl', 'P@nd@', 'P@nth3r', 'P3lic@n', 'P3nguin', 'Pig30n', 'Pir@nh@', 'Pum@', 'R@bbit', 'R@t', 'R@v3n', 'R1s1ng', 'Sc0rpi0n', 'S3@gull', 'Sh@rk', 'Skunk', 'Sl0th', 'Sn@k3', 'Sp@rr0w', 'Spid3r', 'Squirrel', 'T@r@ntul@', 'Tig3r', 'T04d', 'Turk3y', 'Vip3r', 'Vultur3', 'W@lrus', 'W@rthog', 'Wh@l3', 'W0lf', 'W@sp', 'Z3br@']

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

#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# shamelessly stolen and tweaked from...
# https://github.com/e-graveyard/i-love-u
# https://github.com/ythecombinator/happy-valentines

import sys
import os

# Get the current user's name from the USER environment variable
username = os.getenv('USER')

__HEART__ = '''
                           ############         
          ########       ##@@@@@@@@@@@@##       
       #######@@@@@@@@###@@@@@@@@@@@@@@@@##     
     ###@@@@@@@@@@@@@##@@@@@@@@@@@@@@@@@@@@#    
    ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    
    ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    
    ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    
     ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#     
       #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#      
        #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#        
           ##@@@@@@@@@@@@@@@@@@@@@@@@@#         
              ##@@@@@@@@@@@@@@@@@@@@#           
                ##@@@@@@@@@@@@@@@@#             
                  ##@@@@@@@@@@@@#               
                    ##@@@@@@@@@#                
                      ##@@@@@#                  
                       ##@@@#                   
                        #@#                     
'''

class Color:
    @property
    def BOLD_RED(self):
        return '\x1b[1;31;31m'

    @property
    def BOLD_YELLOW(self):
        return '\x1b[1;33;33m'

    @property
    def NORMAL(self):
        return '\x1b[0m'

class Valentine:
    def __init__(self, name):
        self.loved_one = name

    def romanticize(self):
        you_in_my_heart = __HEART__

        while '@' in you_in_my_heart:
            for letter in list(self.loved_one):
                you_in_my_heart = \
                    you_in_my_heart.replace('@', letter, 1)

        return you_in_my_heart

    def i_love_you(self):
        C = Color()

        return '{}{}{}\n'\
            'I love you very much, {}{}{}. Happy Valentine\'s day!'.format(
                C.BOLD_RED, self.romanticize(), C.NORMAL,
                C.BOLD_YELLOW, self.loved_one, C.NORMAL
            )

def main():
    try:
        name = sys.argv[1]

    except IndexError:
        name = username

    my_beloved = Valentine(name)
    print(my_beloved.i_love_you())

if __name__ == '__main__':
    main()

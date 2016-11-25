''''
Python2

USAGE:

RUN program in IDLE, enter y to play, n to exit.

'''

import os
from random import randint


def main():
    start()

def start():
    print "Welcome to Drill #36\n"
    print "I'm your dealer today, and the game is Six Card Draw.\n"

    # raw input from user
    choice = raw_input("Do you want to play? y/n ")  # prompts user

    # Conditional statements: if, elif, else
    if choice == "y":
        print "Great, here are your cards: \n"
        deal()

    elif choice == "n":
        print "Ah well, another time perhaps..."

    elif choice != "y" + "n":
        print "Pls enter y or n only..."

        if choice == "y":
                    print "Terrific, here we go...\n"
                    deal()
        if choice == "n":
                    print "Too bad, you were gonna win..."
                    os._exit(1)

def deal():
    # initialize counters
    handsize  = 6  #  number of cards in a hand
    counter = 0  # counter for how many cards have been dealt
    deckcount = 52  # cards left in the deck
    hand = [] # initially empty hand of six cards

    #USE zip() TO CREATE A LIST OF TUPLES, one tuple per card in deck.  (use loops in future version instead of writing each char)
    # Create a list and iterate through that list using a for loop to print each item out on a new line
    # Create a tuple and iterate through it using a for loop to print each item out on a new line
    cards = [1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13]
    suits = 'cccccccccccccdddddddddddddhhhhhhhhhhhhhsssssssssssss'
    deck = zip(cards, suits)
    
    # Use of a while loops
    # While 'counter' is less than or equal to 6, move random cards from deck to hand
    while counter < handsize:
        acardposition = randint(0,deckcount-1)      # select a random card in the deck
        dealt = deck.pop(acardposition)                # remove card from the deck
        hand.append(dealt)                                  # put card into the hand
        #5. Use the operators +=, ­=
        deckcount -= 1
        counter += 1
    # Call the function you defined in #12 and print the result to the shell
    showHand(hand)
    os._exit(1)


# Defining a function that returns a string variable
def showHand(ahand):
    #9. Use of a for loop
    # print "showHand() called"
    for card, suit in ahand:
        if card == 1:
            card = 'Ace'
        if card == 11:
            card = 'Jack'
        if card == 12:
            card = 'Queen'
        if card == 13:
            card = 'King'
        if suit == 'c':
            suit = 'Clubs'
        if suit == 'd':
            suit = 'Diamonds'
        if suit == 'h':
            suit = 'Hearts'
        if suit == 's':
            suit = 'Spades'
        print str(card) + " of " + str(suit)

    # raw input from user
    choice = raw_input("\nPlay again? y/n :")  # prompts user

    if choice == "y":
        print "\nVery good, here's another hand: \n"
        deal()

    if choice == "n":
        print "\n\nThanks for playing..."
        os._exit(1)

                    

    elif choice != "y" + "n" + "f":
        print "Pls enter y or n, innit?"

        if choice == "y":
                    print "Terrific, here we go..."
                    deal()
        if choice == "n":
                    print "Too bad, you were gonna win..."
                    os._exit(1)

                  
# run game
start()

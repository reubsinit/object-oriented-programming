//
//  main.m
//  Blackjack
//
//  Created by Andrew Cain on 30/03/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#include <stdlib.h>
#include <time.h>

#import <Foundation/Foundation.h>

#import "Card.h"
#import "Deck.h"
#import "BlackjackHand.h"
#import "BlackjackGame.h"

#import "PokerHand.h"
#import "PokerGame.h"


void print_deck(Deck *d);

void play_blackjack()
{
    BlackjackGame * game = [[BlackjackGame alloc] initBlackjackGame];
    
    [game start];
    
    int opt = 0;
    
    while (opt != 2 && ! [[game currentPlayer] full]) 
    {
        printf("Dealer has: %s\n", [[[game dealer] description] UTF8String]);
        printf("You have: %s\n\n", [[[game currentPlayer] description] UTF8String]);
        
        printf("1: Get another card\n2: End go\n\nOption: ");
        scanf(" %d", &opt);
        
        switch (opt) {
            case 1:
                [game hit];
                if ( [[game currentPlayer] score] < 0 )
                {
                    printf("You busted!\n");
                }
                break;
            case 2:
                [game stand];
            default:
                break;
        }        
    }
    
    printf("Dealer has: %s\n", [[[game dealer] description] UTF8String]);
    printf("You have: %s\n\n", [[[game currentPlayer] description] UTF8String]);
    
    if ( [game playerWon] )
    {
        printf("You WON!\n");
    }
    else 
    {
        printf("You lost :(\n");
    }
}

void play_poker()
{
    int players = 1;
    
    printf("Number of Poker hands: ");
    scanf(" %d", &players);
    
    PokerGame *game = [[PokerGame alloc] initPokerGame:players];
    
    [game start];
    
    int opt = 0;
    
    while (! [game gameOver]) 
    {
        printf("You have: %s\n\n", [[[game currentPlayer] description] UTF8String]);
        
        printf("1-5: Remove Card\n0: Ready\n-1: Done\n\nOption: ");
        scanf(" %d", &opt);
        
        switch (opt) {
            case 0:
                [game ready];
                break;
            case -1:
                [game done];
                break;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                [[game currentPlayer] removeCard:opt - 1];
            default:
                break;
        }        
    }
    
    for (int i = 0; i < players; i++)
    {
        BOOL winner = [game player:i] == [game winner];
        
        printf("Player %d has %s", i + 1, [[[game player:i] description] UTF8String]);
        if (winner) printf(" WINNER!");
        printf("\n");
    }
}

int main (int argc, const char * argv[])
{
    srandom((int)time(0));
    
    @autoreleasepool 
    {
        int opt;
        
        do
        {
            opt = -1;
            printf("\n\n1: Blackjack\n2: Poker\n3: Quit\n\nOption: ");
            scanf(" %d", &opt);
            
            switch (opt) {
                case 1:
                    play_blackjack();
                    break;
                case 2:
                    play_poker();
                    break;
                case 3:
                    break;
                default:
                    printf("Enter 1, 2, or 3 only.\n\n");
                    scanf("%*[^\n]");
                    break;
            }
        }while (opt != 3);
    }
    return 0;
}


void print_deck(Deck *d)
{
    for(int i = 0; i < 52; i++)
    {
        Card *c = [d draw];
        [c turnOver];
        printf("%s\n", [[c description] UTF8String]);
    }    
}

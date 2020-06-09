//
//  main.m
//  Monopoly
//
//  Created by Reuben Wilson on 19/08/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Die.h"
#import "stdlib.h"
#import "Dice.h"
#import "Board.h"
#import "Player.h"
#import "Tile.h"
#import "MonopolyGame.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        BOOL running = true;
        char choice = '\0';
        int playerCount;
        
        /**
         Initialisation of a MonopolyGame object.
         */
        MonopolyGame *currentGame = [[MonopolyGame alloc] init];
        
        /**
         Small menu constructed to ask for the number of Players.
         Input given will be the number of Player objects created.
         Each object is added to the MonopolyGame object and placed
         on the Go tile, or tileAtIdx:0
         */
        NSLog(@"Enter the number of players: ");
        scanf("%i", &playerCount);
        for (int i = 0; i < playerCount; i++)
        {
            Player *player = [[Player alloc] initWithName:[NSString stringWithFormat:@"Player-%d",i + 1] inGame:currentGame];
            [currentGame addPlayer:player];
            [player placeOn:[[currentGame board] tileAtIdx:0]];
        }
        
        /**
         Construction of simple game menu using
         a while loop. User is given two options:
         'r' to roll
         'q' to quit - upon which the loop is broken
         */
        while (running)
        {
            for (int i = 0; i < playerCount; i++)
            {
                /**
                 Simple message to inform user of current Player cash levels and which
                 Player they are.
                 */
                [currentGame setCurrentPlayerIdx:i];
                NSLog(@"%@ has $%i\n", [[currentGame playerAtIdx:i] name], [[currentGame playerAtIdx:i] cash]);
                NSLog(@"It is %@'s turn...\n", [[currentGame playerAtIdx:i]name]);
                NSLog(@"\n[R]oll\n[Q]uit\n");
                NSLog(@"Option: ");
                scanf("%s", &choice);
                NSString *inp = [[NSString alloc] initWithFormat:@"%c",choice];
                
                /**
                 If the user selects 'r' for roll
                 the MonopolyGame method performMove
                 is used to moved the currentPlayer
                 */
                if (([inp isEqualToString:@"r"]) || ([inp isEqualToString:@"R"]))
                {
                    [currentGame performMove];
                    running = true;
                }
                else if(([inp isEqualToString:@"q"]) || ([inp isEqualToString:@"Q"]))
                {
                    running = false;
                }
                else
                {
                    printf("That is not a valid option...\n");
                    choice = '\0';
                }
            }
        }
    }
    return 0;
}


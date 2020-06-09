//
//  MonopolyGame.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Board;
@class Player;
@class Dice;
@class Die;
@class Tile;
@class JailTile;
@class PropertyTile;
@class MonopolyEvent;
@class TransAction;
@class MoveAction;
@class JailAction;

/**
 Declaration of class, MonopolyGame with fields:
 _board             as a Board. Required to store an instance of the class, Board
 _dice              as Dice. Required to store the Dice object that the game needs to operate
 _players           as a NSMutableArray. Required to store the Player objects that are playing the game
 _currentPlayerIdx  as an integer. Required to known which Player, by their index in the array _players, is the
                    current player
 */
@interface MonopolyGame : NSObject
{
    Board           *_board;
    Dice            *_dice;
    NSMutableArray  *_players;
    int             _currentPlayerIdx;
}

/**
 Declaration of five class assistive properties:
 currentPlayer      as a readonly getter - returns a Player
 playerCount        as a readonly getter - returns an NSUInteger
 dice               as a readonly getter - returns a Dice
 board              as a readonly getter - returns a Board
 currentPlayerIdx   as a setter/getter - returns an integer
 */
@property (readonly) Player * currentPlayer;
@property (readonly) NSUInteger playerCount;
@property (readonly) Dice * dice;
@property (readonly) Board * board;
@property (readwrite, assign) int currentPlayerIdx;

/**
 Declaration of four class assistive methods:
 init
 addPlayer              takes a Player as a parameter
 playerAtIdx            takes an integer as a parameter - returns a Player
 performMove
 announceMonopolyEvent  takes a MonopolyEvent as a parameter
 */
- (id) init;
- (void) addPlayer:(Player *)p;
- (Player *) playerAtIdx:(int)i;
- (void) performMove;
- (void) announceMonopolyEvent:(MonopolyEvent *)e;

@end

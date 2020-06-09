//
//  MonopolyGame.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "MonopolyGame.h"
#import "Board.h"
#import "Player.h"
#import "Dice.h"
#import "Die.h"
#import "Tile.h"
#import "JailTile.h"
#import "TransAction.h"
#import "MoveAction.h"
#import "JailAction.h"
#import "MonopolyEvent.h"

/**
 Declaration of three private class assistive methods:
 createBoard
 createDice
 setupBoardActions
 */
@interface MonopolyGame (private)
- (void) createBoard;
- (void) createDice;
- (void) setupBoardActions;
@end

/**
 Implementation of class, MonopolyGame
 */
@implementation MonopolyGame

/**
 Implementation of three syntehsized properties:
 dice               returns value store in field _dice
 board              returns value stored in field _board
 currentPlayerIdx   returns value stored in field _currentPlayerIdx
 */
@synthesize dice = _dice;
@synthesize board = _board;
@synthesize currentPlayerIdx = _currentPlayerIdx;

/**
 Implementation of two dynamic properties:
 */
@dynamic currentPlayer;
@dynamic playerCount;

/**
 Dynamic property, currenPlayer:
 Returns the player in the array of players, or _players
 found at the index represented by the _currentPlayerIdx
*/
- (Player *) currentPlayer
{
    return [_players objectAtIndex:_currentPlayerIdx];
}

/**
 Dynamic property, playerCount:
 Returns the count of the number of objects
 in the array of players, or _players
 */
- (NSUInteger) playerCount
{
    return [_players count];
}

/**
 Implementation of method, init:
 Defined as the MonopolyGame class initialiser.
 By default, the _players field is initialised
 as a NSMutableArray and _currenPlayerIdx is set to 0.
 Three private class methods are called to fulfil their obligations:
 createBoard
 createDice
 setupBoardActions
 */
- (id) init
{
    self = [super init];
    if (self != nil)
    {
        _players= [[NSMutableArray alloc] init];
        _currentPlayerIdx = 0;
        [self createBoard];
        [self createDice];
        [self setupBoardActions];
    }
    return self;
}

/**
 Implementation of addPlayer:
 Passed a parameter as a Player.
 Passed parameter is then added to the array of players, 
 or to field _players
 */
- (void) addPlayer:(Player *)p
{
    [_players addObject:p];
}

/**
 Implementation of method, playerAtIdx:
 Passed a parameter as an integer.
 The Player object at the passed index
 parameter is returned from the array of players, or
 _players.
 */
- (Player *) playerAtIdx:(int)i
{
    return [_players objectAtIndex:i];
}

/**
 Implementation of performMove:
 Calls the player move method on the current
 player at the currentPlayerIdx in the array of players,
 or _players. Passes the Dice in _dice as a parameter
 */
- (void) performMove
{
    [[self playerAtIdx:_currentPlayerIdx] move:_dice];
}

/**
 Implementation of announceMonopolyEvent:
 Passed a parameter as a MonopolyEvent.
 The passed events description field is then
 printed to the screen
 */
- (void) announceMonopolyEvent:(MonopolyEvent *)e
{
    NSLog(@"\n%@\n", [e description]);
}

@end


@implementation MonopolyGame (private)

/**
 Implementation of createBoard:
 Creates fourty unique game tiles, each with their own NSString
 description. Each tile is then added to the _board's array of tiles. 
 After all the tiles have been
 created, the board method linkTile is called to link each
 tile with one another.
 */
- (void) createBoard
{
    _board = [[Board alloc] init];
    
    Tile *tile1 = [[Tile alloc] initWithName:@"GO\n"];
    [_board addTile:tile1];
    
    Tile *tile2 = [[Tile alloc] initWithName:@"Old Kent Road\n"];
    [_board addTile:tile2];
    
    Tile *tile3 = [[Tile alloc] initWithName:@"Community Chest\n"];
    [_board addTile:tile3];
    
    Tile *tile4 = [[Tile alloc] initWithName:@"Whitechapel Road\n"];
    [_board addTile:tile4];
    
    Tile *tile5 = [[Tile alloc] initWithName:@"Income Tax\n"];
    [_board addTile:tile5];
    
    Tile *tile6 = [[Tile alloc] initWithName:@"Kings Cross Station\n"];
    [_board addTile:tile6];
    
    Tile *tile7 = [[Tile alloc] initWithName:@"The Angel Islington\n"];
    [_board addTile:tile7];
    
    Tile *tile8 = [[Tile alloc] initWithName:@"Chance\n"];
    [_board addTile:tile8];
    
    Tile *tile9 = [[Tile alloc] initWithName:@"Euston Road\n"];
    [_board addTile:tile9];
    
    Tile *tile10 = [[Tile alloc] initWithName:@"Pentonville Road\n"];
    [_board addTile:tile10];
    
//    Tile *tile11 = [[Tile alloc] initWithName:@"Jail\n"];
//    [_board addTile:tile11];
    
    JailTile *tile11 = [[JailTile alloc] initWithName:@"Jail\n"];
    [_board addTile:tile11];
    
    Tile *tile12 = [[Tile alloc] initWithName:@"Pall Mall\n"];
    [_board addTile:tile12];
    
    Tile *tile13 = [[Tile alloc] initWithName:@"Electric Company\n"];
    [_board addTile:tile13];
    
    Tile *tile14 = [[Tile alloc] initWithName:@"Whitehall\n"];
    [_board addTile:tile14];
    
    Tile *tile15 = [[Tile alloc] initWithName:@"Northumberland Avenue\n"];
    [_board addTile:tile15];
    
    Tile *tile16 = [[Tile alloc] initWithName:@"Marylbone Station\n"];
    [_board addTile:tile16];
    
    Tile *tile17 = [[Tile alloc] initWithName:@"Bow Street\n"];
    [_board addTile:tile17];
    
    Tile *tile18 = [[Tile alloc] initWithName:@"Commmunity Chest\n"];
    [_board addTile:tile18];
    
    Tile *tile19 = [[Tile alloc] initWithName:@"Marlborough Street\n"];
    [_board addTile:tile19];
    
    Tile *tile20 = [[Tile alloc] initWithName:@"Vine Street\n"];
    [_board addTile:tile20];
    
    Tile *tile21 = [[Tile alloc] initWithName:@"Free Parking\n"];
    [_board addTile:tile21];
    
    Tile *tile22 = [[Tile alloc] initWithName:@"Strand\n"];
    [_board addTile:tile22];
    
    Tile *tile23 = [[Tile alloc] initWithName:@"Chance\n"];
    [_board addTile:tile23];
    
    Tile *tile24 = [[Tile alloc] initWithName:@"FLeet Street\n"];
    [_board addTile:tile24];
    
    Tile *tile25 = [[Tile alloc] initWithName:@"Trafalga Square\n"];
    [_board addTile:tile25];
    
    Tile *tile26 = [[Tile alloc] initWithName:@"Fenchurch Street\n"];
    [_board addTile:tile26];
    
    Tile *tile27 = [[Tile alloc] initWithName:@"Leichester Street\n"];
    [_board addTile:tile27];
    
    Tile *tile28 = [[Tile alloc] initWithName:@"Coventry Street\n"];
    [_board addTile:tile28];
    
    Tile *tile29 = [[Tile alloc] initWithName:@"Water Works\n"];
    [_board addTile:tile29];
    
    Tile *tile30 = [[Tile alloc] initWithName:@"Piccadilly\n"];
    [_board addTile:tile30];
    
    Tile *tile31 = [[Tile alloc] initWithName:@"Go To Jail\n"];
    [_board addTile:tile31];
    
    Tile *tile32 = [[Tile alloc] initWithName:@"Regent Street\n"];
    [_board addTile:tile32];
    
    Tile *tile33 = [[Tile alloc] initWithName:@"Oxford Street\n"];
    [_board addTile:tile33];
    
    Tile *tile34 = [[Tile alloc] initWithName:@"Community Chest\n"];
    [_board addTile:tile34];
    
    Tile *tile35 = [[Tile alloc] initWithName:@"Bond Street\n"];
    [_board addTile:tile35];
    
    Tile *tile36 = [[Tile alloc] initWithName:@"Liverpool Station\n"];
    [_board addTile:tile36];
    
    Tile *tile37 = [[Tile alloc] initWithName:@"Chance\n"];
    [_board addTile:tile37];
    
    Tile *tile38 = [[Tile alloc] initWithName:@"Park Lane\n"];
    [_board addTile:tile38];
    
    Tile *tile39 = [[Tile alloc] initWithName:@"Super Tax\n"];
    [_board addTile:tile39];
    
    Tile *tile40 = [[Tile alloc] initWithName:@"Mayfair\n"];
    [_board addTile:tile40];
    
    [_board linkTile];
}

/**
 Implementation of createDice:
 Initialises the _dice field. A for loop
 is used to create two die, each with 6 sides. They
 are both added to the Dice object stored in the field _dice.
 */
-(void) createDice
{
    _dice = [[Dice alloc] init];
    for (int i = 0; i < 2; i++)
    {
        Die *die = [[Die alloc] initWithSides:6];
        [_dice addDie:die];
    }
}

/**
 Implementation of setupBoardActions:
 For each tile that has a particular action related to it,
 whether it be a land action or pass action. In particular,
 the Go tile (tileAt:0) and the go to jail tile (tileAt:30)
 are assigned their appropriate actions.
 The go tile is assigned a TransAction to its _passAction field.
 The go to jail tile is assigned a JailAction to its _landAction field.
 */
-(void) setupBoardActions
{
    [[_board tileAtIdx:0] setPassAction:[[TransAction alloc] initWithValue:200 description:@"Collect $200 as you pass GO"]];
    [[_board tileAtIdx:30] setLandAction:[[JailAction alloc] initWithJailTile:[_board tileAtIdx:10]]];

}


@end
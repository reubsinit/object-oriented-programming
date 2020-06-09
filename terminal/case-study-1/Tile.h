//
//  Tile.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
@class Player;
@class Dice;

/**
 Declaration of class, Tile with fields:
 _nexTile       as a Tile. Required so that each Tile may know which till follows it on the board
 _players       as a NSMutableArray. Required so that each Tile may know which Player objects are on it
 _name          as a NSString. Required to store a descriptive name for the Tile
 _landAction    as an Action. Required to know what Action is involved when a Player lands on a Tile
 _passAction    as an Action. Required to know what Action is involved when a Player passes a Tile
 */
@interface Tile : NSObject
{
    Tile                *_nextTile;
    NSMutableArray      *_players;
    NSString            *_name;
    NSObject <Action>   *_landAction;
    NSObject <Action>   *_passAction;
    
}

/**
 Declaration of four class assistive properties:
 nexTile        as a setter/getter - returns a Tile
 description    as a readonly getter - returns a NSString
 landAction     as a setter/getter - returns an Action
 passAction     as a setter/getter - returns an Action
 */
@property (readwrite, retain) Tile * nextTile;
@property (readonly) NSString * description;
@property (readwrite, retain) NSObject <Action> * landAction;
@property (readwrite, retain) NSObject <Action> * passAction;

/**
 Declaration of four class assistive methods:
 initWithName   takes a NSString as a parameter
 move           takes three parameters as Player, Dice, integer
 land           takes a Player as a parameter
 leave          takes a Player as a parameter
 */
- (id) initWithName:(NSString *)n;
- (void) move:(Player *)p using:(Dice *)d remainingSteps:(int)n;
- (void) land:(Player *)p;
- (void) leave:(Player *)p;
@end

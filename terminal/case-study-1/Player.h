//
//  Player.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Tile;
@class MonopolyGame;
@class Dice;
@class MonopolyEvent;
@class JailAction;

/**
 Declaration of class, Player with fields:
 _isOn      as a Tile. Required for the Player to know which Tile it is currently on
 _name      as a NSString. Required so that the Player may have a descriptive name
 _playing   as a MonopolyGame. Required to know about the game that the Player is playing
 _cash      as an integer. Required to know about cash reserves of a Player
 _turnCounr as an integer. Required to know how many turns a Player has had.
 */
@interface Player : NSObject
{
    Tile            *_isOn;
    NSString        *_name;
    MonopolyGame    *_playing;
    int             _cash;
    int             _turnCount;
}

/**
 Declaration of five class assistive properties:
 name      as a readonly getter - returns a NSString
 isOn      as a readonly getter - returns a Tile
 cash      as a readonly getter - returns an integer
 turnCount as a readonly getter - returns an integer
 playing   as a readonly getter - returns a MonopolyGame
 */
@property (readonly) NSString * name;
@property (readonly) Tile * isOn;
@property (readonly) int cash;
@property (readonly) int turnCount;
@property (readonly) MonopolyGame * playing;

/**
 Declaration of five class assistive methods:
 initWithName   takes two parameters as a NSString and a MonopolyGame
 move           takes a Dice as a parameter
 move           takes two parameters as an integer and a NSString
 placeOn        takes a Tile as a parameter
 changeCash     takes two parameters as an integer and a NSString
 */
- (id) initWithName:(NSString *)name inGame:(MonopolyGame *)g;
- (void) move:(Dice *)d;
- (void) move:(int)i description:(NSString *)d;
- (void) placeOn:(Tile *)t;
- (void) changeCash:(int)c description:(NSString *)d;

@end

//
//  Player.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "Player.h"
#import "Tile.h"
#import "Dice.h"
#import "MonopolyEvent.h"
#import "MonopolyGame.h"
#import "JailAction.h"

/**
 Implementation of class, Player
 */
@implementation Player

/**
 Implementation of five synthesized properties:
 name       returns value stored in _name
 isOn       returns value stored in _isOn
 cash       returns value stored in _cash
 turnCount  returns value stored in _turnCount
 playing    returns value stored in _playing
 */
@synthesize name = _name;
@synthesize isOn = _isOn;
@synthesize cash = _cash;
@synthesize turnCount = _turnCount;
@synthesize playing = _playing;

/**
 Implementation of method, initWithName:
 Defined as the Player class initialiser.
 Passed two parameters as a NSString and a MonopolyGame.
 The passed NSString is the used
 inialise the field _name while the passed MonopolyGame
 is used t initialise the field _playing.
 By default _isOn is initialised as NULL, _cash is 500
 and _turnCount to 0.
 */
- (id) initWithName:(NSString *)name inGame:(MonopolyGame *)g
{
    self = [super init];
    if (self != nil)
    {
        _isOn = NULL;
        _name = name;
        _playing = g;
        _cash = 500;
        _turnCount = 0;
    }
    return self;
}

/**
 Implementation of method, move:
 Passed a parameter as a Dice.
 Firstly, the passed Dice, d is rolled,
 then the Tile move method is called, passing
 the Player, p and the Dice, d totalValue.
 This method initialises two sepearte MonopolyEvents,
 the first of which announces any details in relation to the Dice roll
 and the second indicates where the Player ends up after moving.
 */
- (void) move:(Dice *)d
{
    [d roll];
    
    MonopolyEvent * rollEvent = [MonopolyEvent newDiceEventFor:self using:d];
    [[self playing] announceMonopolyEvent:rollEvent];
    
    [_isOn move:self using:d remainingSteps:[d totalValue]];
    
    MonopolyEvent * newLocationEvent = [MonopolyEvent newLandEventFor:self landingOn:_isOn];
    [[self playing] announceMonopolyEvent:newLocationEvent];
    _turnCount += 1;
    
//    if ([_isOn landAction])
//    {
//        [[_isOn landAction] perform:self];
//    }
}

/**
 Implementation of method, move:
 Passed two parameters as an integer and a NSString.
 Method calls the Tile move method
 and passes NULL Dice through, passes the integer parameter
 as the remaining steps. The NSString passed is used
 to create a MonopolyEvent
 */
- (void) move:(int)i description:(NSString *)d
{
    [_isOn move:self using:NULL remainingSteps:i];
}

/**
 Implementation of method, placeOn:
 Passed a parameter as a Tile.
 The passed parameter is then assigned to the
 field _isOn.
 */
- (void) placeOn:(Tile *)t
{
    [_isOn leave:self];
    _isOn = t;
    [_isOn land:self];
}

/**
 Implementation of changeCash:
 Passed a parameter as an integer.
 The passed integer, be it positive or negative
 is then added to the players _cash field. This is used
 for transactions etc
 */
-(void) changeCash:(int)c description:(NSString *)d
{
    _cash += c;
}
@end

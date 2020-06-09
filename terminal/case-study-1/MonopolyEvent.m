//
//  MonopolyEvent.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "MonopolyEvent.h"
#import "Dice.h"
#import "Die.h"
#import "Player.h"
#import "Tile.h"
/**
 Implementation of class, MonopolyEvent
 */
@implementation MonopolyEvent

/**
 Implementation of one synthesized property:
 description    returns value stored in field _description
 */
@synthesize description = _description;

/**
 Implementation of method, initWithPlayer:
 Passed three parameters as a Player, NSObject, NSString.
 Defined as the class initialiser.
 By default, the _player field is assigned the value of the passed Player
 the _object field is assigned the value of the passed NSObject
 the _description field is assigned the value of the passed NSString
 */
-(id) initWithPlayer:(Player *)p objectKind:(NSObject *)o description:(NSString *)desc
{
    self = [super init];
    if (self != nil)
    {
        _player = p;
        _object = o;
        _description = desc;
    }
    return self;
}

/**
 Implementation of newDiceEventFor:
 Passed two parameters as a Player and a Dice - returns a MonopolyEvent.
 This method is utilised to describe the data related to the Dice object
 and the individual Die objects it manages. When the Die in Dice are rolled
 it produces a textual depiction of the Die top values and the total value rolled.
 */
+(MonopolyEvent *) newDiceEventFor:(Player *)p using:(Dice*)d
{
    NSString *desc = [NSString stringWithFormat:@"\nDie 1 had a value of %d\nDie 2 had a value of %d\n%@ rolled a total of %d!\n", [[d dieAtIdx:0] topValue], [[d dieAtIdx:1] topValue], [p name], [d totalValue]];
    
    MonopolyEvent *result = [[MonopolyEvent alloc]
                             initWithPlayer:p
                             objectKind:d
                             description:desc];
    return result;
    
}

/**
 Implementation of newLandEventFor:
 Passed two parameters as a Player and a Tile - returns a MonopolyEvent.
 This method is utilised to describe the Tile object that a Player lands on
 after rolling their Dice and moving around the Board.
 */
+(MonopolyEvent *) newLandEventFor:(Player *)p landingOn:(Tile *)t
{
    NSString *desc = [NSString stringWithFormat: @"\n%@ is on %@\n", [p name], [t description]];
    
    MonopolyEvent *result = [[MonopolyEvent alloc]
                             initWithPlayer:p
                             objectKind:t
                             description:desc];
    return result;
    
}

/**
 Implementation of newTransActionEventFor:
 Passed two parameters as a Player and an Action - returns a MonopolyEvent.
 This method is utilised to describe the TransAction object that a Player initialises
 by tiggering such an event.
 */
+(MonopolyEvent *) newTransactionEventFor:(Player *)p withAction:(NSObject <Action> *)a
{
    NSString *desc = [NSString stringWithFormat: @"\n%@\n", [a description]];
    
    MonopolyEvent *result = [[MonopolyEvent alloc]
                             initWithPlayer:p
                             objectKind:a
                             description:desc];
    return result;
}

/**
 Implementation of newMoveActionEventFor:
 Passed two parameters as a Player and an Action - returns a MonopolyEvent.
 This method is utilised to describe the MoveAction object that a Player initialises
 by tiggering such an event.
 */
+(MonopolyEvent *) newMoveActionEventFor:(Player *)p withAction:(NSObject<Action> *)a
{
    NSString *desc = [NSString stringWithFormat:@"\n%@\n", [a description]];
    MonopolyEvent *result =[[MonopolyEvent alloc]
                            initWithPlayer:p
                            objectKind:a
                            description:desc];
    return result;
}

@end

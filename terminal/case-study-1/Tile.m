//
//  Tile.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "Tile.h"
#import "Player.h"
/**
 Implementation of class, Tile
 */
@implementation Tile

/**
 Implementation of four synthesized properties:
 nextTile      returns value stored in _nextTile
 description   returns value stored in _name
 landAction    returns value stored in _landAction
 passAction    returns value stored in _passAction
 */
@synthesize nextTile = _nextTile;
@synthesize description = _name;
@synthesize landAction = _landAction;
@synthesize passAction = _passAction;

/**
 Implementation of method, initWithName:
 Defined as the Tile class initialiser.
 Passed a parameter as a NSString.
 The passed parameter is then used to
 inialise the field _name.
 By default _players is initialised as a NSMutableArray
 and _nextTile is assigned NUll.
 */
- (id) initWithName:(NSString *)n
{
    self = [super init];
    if (self != nil)
    {
        _nextTile = NULL;
        _players = [[NSMutableArray alloc] init];
        _name = n;
    }
    return self;
}

/**
 Implementation of method, move:
 Used to move the player around the board to the target
 tile depicted by the passed integer n (remaining steps).
 This method uses recursion, meaning the method itself is 
 called within its own body. Each time the recursive method 
 is called, the Tile removes the player, p, from its
 _players field and the remainingSteps is decreased by 1.
 When remaining steps is not greater than 0, the player has
 reached their destination Tile. Destination Tile is updated
 with the player, p and the player metho placeOn is called
 to update the player, p _isOn field. 
 If a Tile that the Player passes has a PassAction, it is
 performed on the Player
 */
- (void) move:(Player *)p using:(Dice *)d remainingSteps:(int)n
{
    if ([self passAction] && [p turnCount] > 0)
    {
        [[self passAction] perform:p];
    }
    
    if (n > 0)
    {
        [_nextTile move:p using:d remainingSteps:--n];
    }
    
    else
    {
        [p placeOn:self];
    }
}

/**
 Implementation of land:
 Passed a parameter as a Player.
 Passed Player is then added to the _players NSMutableArray
 */
- (void) land:(Player *)p
{
    [_players addObject:p];
}

/**
 Implementation of leave:
 Passed a parameter as a Player.
 Passed Player is then removed from
 the _players NSMutableArray
 */
- (void) leave:(Player *)p
{
    [_players removeObject:p];
}
@end

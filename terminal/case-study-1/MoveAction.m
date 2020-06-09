//
//  MoveAction.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "MoveAction.h"
#import "Player.h"

/**
 Implementation of class, MoveAction
 */
@implementation MoveAction

/**
 Implementation of one synthesized property:
 description    returns value stored in _description
 */
@synthesize description = _description;

/**
 Implementation of method, initWithDistance:
 Passed two parameters as an integer and a NSString
 Defined as the MoveAction class initialiser.
 The _distance field is assigned the value of the passed integer
 the _description field is assigned the value of the passed NSString
 */
- (id) initWithDistance:(int)dist description:(NSString *)d
{
    self = [super init];
    if (self != nil)
    {
        _distance = dist;
        _description = d;
    }
    return self;
}

/**
 Implementation of method, perform:
 Passed a parameter as a Player.
 Calls the Player method move with
 the passed player and passes through fields
 _distance and _description
 */
- (void) perform:(Player *)p
{
    [p move:_distance description:_description];
}
@end

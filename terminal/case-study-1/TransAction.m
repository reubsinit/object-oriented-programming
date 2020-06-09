//
//  TransAction.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "TransAction.h"
#import "Player.h"
#import "MonopolyEvent.h"
#import "MonopolyGame.h"

/**
 Implementation of class, TransAction
 */
@implementation TransAction

/**
 Implementation of one synthesized property:
 description    returns value stored in _description
 */
@synthesize description = _description;

/**
 Implementation of method, initWithValue:
 Passed two parameters as an integer and a NSString
 Defined as the TransAction class initialiser.
 The _value field is assigned the value of the passed integer
 the _description field is assigned the value of the passed NSString
 */
- (id) initWithValue:(int)v description:(NSString *)d
{
    self = [super init];
    if (self != nil)
    {
        _value = v;
        _description = d;
    }
    return self;
}

/**
 Implementation of method, perform:
 Passed a parameter as a Player.
 Calls the Player method changeCash with
 the passed player and passes through fields
 _value and _description
 */
- (void) perform:(Player *)p
{
    MonopolyEvent * transactionEvent = [MonopolyEvent newTransactionEventFor:p withAction:self];
    [[p playing] announceMonopolyEvent:transactionEvent];
    [p changeCash:_value description:_description];
}
@end

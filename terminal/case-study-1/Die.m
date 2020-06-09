//
//  Die.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "Die.h"

/**
 Implementation of class, Die
 */
@implementation Die

/**
 Implementation of two synthesized properties:
 sides      returns value stored in _sides
 topValue   returns value stored in _topValue
 */
@synthesize sides = _sides;
@synthesize topValue = _topValue;

/**
 Implementation of method, initWithSides:
 Defined as the Die class initialiser.
 Passed a parameter as an integer.
 The passed parameter is then used to 
 inialise the field _sides.
 By default _topValue is set to 0.
 */
- (id) initWithSides:(int)s
{
    self = [super init];
    if (self != nil)
    {
        _sides = s;
        _topValue = 0;
    }
    return self;
}

/**
 Implementation of method, roll:
 _topValue is assigned a random number
 based upon the number of sides that field
 _sides contains using the function arc4random()
 i.e. calling the roll method will set _topValue a
 random number between 1 and 6, providing the Die 
 has 6 sides.
 */
- (void) roll
{
    _topValue = arc4random() %_sides + 1;
}
@end

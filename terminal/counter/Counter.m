//
//  Counter.m
//  Counter
//
//  Created by Reuben Wilson on 14/08/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//
#import "Counter.h"

/**
 Implementation of class, Counter.
 */
@implementation Counter

/**
 One syenthesized property getter to return value stored in field:
 _count
 Property count can also be used to set the
 value of field _count
 */
@synthesize count = _count;

/**
 Implementation of class instance initialiser.
 _count      initialised with value 0
 */
-(id) init
{
    if ( self = [super init])
    {
        _count = 0;
    }
    return self;
}

/**
 Implementation of increment:
 Increases the value of _count by 1.
 */
- (void) increment
{
    _count++;
}

/**
 Implementation of reset:
 Sets the value of _count to 0.
 */
- (void) reset
{
    _count = 0;
}


@end

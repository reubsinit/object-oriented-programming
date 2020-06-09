//
//  Dice.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "Dice.h"
#import "Die.h"

/**
 Implementation of class, Dice
 */
@implementation Dice

/**
 Implementation of two dynamic properties:
 */
@dynamic totalValue;
@dynamic allSame;

/**
 Dynamic property, totalValue:
 Creates a temporary variable, result as an integer.
 Each Die in NSMutableArray _dice has its top value returned
 by calling the die method topValue and subsequently, it is
 added to the variable result. Once all Die have been
 processed, the result is returned, representing the total
 value of all Die.
 */
- (int) totalValue
{
    int result = 0;
    for (Die *d in _dice)
    {
        result += [d topValue];
    }
    return result;
}

/**
 Dynamic property, totalValue:
 A for loop is used to check the two Die in _dice to
 see if they have the same top value. If they do, true
 is returned, else false is returned.
 */
- (BOOL) allSame
{
    for (int i = 1; i < [_dice count]; i++)
    {
        if ([[self dieAtIdx:0] topValue] == [[self dieAtIdx:i] topValue])
            return true;
    }
    return false;
}

/**
 Implementation of method, init:
 Defined as the Dice class initialiser.
 By default, the _dice field is initialised
 as a NSMutableArray.
 */
- (id) init
{
    self = [super init];
    if (self != nil)
    {
        _dice = [[NSMutableArray alloc] init];
    }
    return self;
}

/**
 Implementation of method, addDie:
 Passed a parameter as a Die.
 The passed Die is then added to the array of die, or
 _dice.
 */
- (void) addDie:(Die *)d
{
    [_dice addObject:d];
}

/**
 Implementation of method, dieAtIdx:
 Passed a parameter as an integer.
 The Die object at the passed index
 parameter is returned from the array of dice, or
 _dice.
 */
- (Die *) dieAtIdx:(int)idx
{
    return [_dice objectAtIndex:idx];
}

/**
 Implementation of method, roll:
 Each Die in the array of die, or _dice
 is rolled using the Die method roll.
 */
- (void) roll
{
    for (Die *d in _dice)
    {
        [d roll];
    }
}
@end

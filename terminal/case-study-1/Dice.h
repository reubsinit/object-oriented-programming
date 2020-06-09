//
//  Dice.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Die;

/**
 Declaration of class, Dice with field:
 _dice  as an NSMutableArray. Required to store the individual Die objects
 */
@interface Dice : NSObject
{
    NSMutableArray *_dice;
}

/**
 Declaration of two class assistive properties:
 totalValue        as a readonly getter - returns an integer
 allSame           as a readonly getter - returns a boolean
 */
@property (readonly) int totalValue;
@property (readonly) BOOL allSame;

/**
 Declaration of four class assistive methods:
 init      
 addDie     passed a Die as a parameter
 dieAtIdx   passed an integer as a parameter - returns a Die
 roll
 */
- (id) init;
- (void) addDie:(Die *)d;
- (Die *) dieAtIdx:(int)idx;
- (void) roll;

@end

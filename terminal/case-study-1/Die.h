//
//  Die.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Declaration of class, Die with fields:
 _sides     as an integer. Required to store the number of sides of a Die
 _topValue  as an integer. Required to store the top value of a Die
 */
@interface Die : NSObject
{
    int     _sides;
    int     _topValue;
}

/**
 Declaration of two class assistive properties:
 sides          as a readonly getter - returns an integer
 topValue       as a readonly getter - returns an integer
 */
@property (readonly) int sides;
@property (readonly) int topValue;

/**
 Declaration of two class assistive methods:
 initWithSides       takes a parameter as an integer
 roll
 */
- (id) initWithSides:(int)s;
- (void) roll;

@end

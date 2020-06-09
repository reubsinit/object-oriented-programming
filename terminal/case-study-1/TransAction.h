//
//  TransAction.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
@class Player;
@class MonopolyEvent;
@class MonopolyGame;

/**
 Declaration of class, TransAction with fields:
 _value         as an integer. Required to know what a particular TransActions money value is worth
 _description   as an NSString. Required to provide a string based description for a TransAction
 
 This class inherits from the Action protocol
 */
@interface TransAction : NSObject <Action>
{
    int         _value;
    NSString    *_description;
}

/**
 Declaration of one class assistive property:
 description    as a readonly getter - returns a NSString
 */
@property (readonly) NSString * description;

/**
 Declaration of two class assistive methods:
 initWithValue   takes two parameters as an integer and a NSString
 perform        takes a parameter as a Player. Inherited from Action
 */
- (id) initWithValue:(int)v description:(NSString *)d;
- (void) perform:(Player *)p;
@end

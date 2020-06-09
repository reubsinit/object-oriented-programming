//
//  MoveAction.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
@class Player;

/**
 Declaration of class, MoveAction with fields:
 _distance      as an integer. Required to know how far a Player is to be moved
 _description   as an NSString. Required to provide a string based description for a MoveAction
 
 This class inherits from the Action protocol
 */
@interface MoveAction : NSObject <Action>
{
    int         _distance;
    NSString    *_description;
}

/**
 Declaration of one class assistive property:
 description    as a readonly getter - returns a NSString
 */
@property (readonly) NSString * description;

/**
 Declaration of two class assistive methods:
 initWithDistance   takes two parameters as an integer and a NSString
 perform            takes a parameter as a Player. Inherited from Action
 */
- (id) initWithDistance:(int)dist description:(NSString *)d;
- (void) perform:(Player *)p;
@end

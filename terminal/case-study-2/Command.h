//
//  Command.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 20/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IdentifiableObject.h"
@class Player;

/**
 Declaration of class, Command.
 Inherits entire functionality set from IdentifiableObject
 */
@interface Command : IdentifiableObject

/**
 Declaration of one class assistive method:
 execute    takes two parameters as a Player and a NSArray - returns a NSString
 */
-(NSString *) execute:(Player *)p command:(NSArray *)text;

@end

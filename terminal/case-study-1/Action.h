//
//  Action.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

/**
 Declaration of protocol, action with method:
 perform    takes a Player as a parameter
 */
@protocol Action

- (void) perform:(Player *)p;

@end

//
//  JailTile.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
@class Player;

/**
 Declaration of class, JailTile with field:
 _timeMap   as a NSDictionary. Required to track how long a player has been on the JailTile for
 */
@interface JailTile : Tile
{
    NSDictionary *_timeMap;
}

/**
 Declaration of two class assistive methods:
 move       takes three parameters as a Player, Dice and an integer
 lockUp     takes a parameter as a Player
 */
- (id) initWithName:(NSString *)n;
- (void) move:(Player *)p using:(Dice *)d remainingSteps:(int)n;
- (void) lockUp:(Player *)p;

@end

//
//  Board.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Tile;

/**
 Declaration of class, Board with field:
 _tiles     as a NSMutableArray. Required to store all the Tile objects that the Board needs 
 */
@interface Board : NSObject
{
    NSMutableArray  *_tiles;
}

/**
 Declaration of one class assistive property:
 tileCount    as a readonly getter - returns an NSUInteger
 */
@property (readonly) NSUInteger tileCount;

/**
 Declaration of five class assistive methods:
 init           
 addTile    takes a Tile as a parameter
 tileAtIdx  takes an integer as a parameter - returns a Tile
 tileNamed  takes a NSString as a parameter - returns a Tile
 linkTile
 */
- (id) init;
- (void) addTile:(Tile *)t;
- (Tile *) tileAtIdx:(int)idx;
- (Tile *) tileNamed:(NSString *)name;
- (void) linkTile;

@end

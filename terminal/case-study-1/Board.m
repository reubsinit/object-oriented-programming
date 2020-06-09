//
//  Board.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 28/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "Board.h"
#import "Tile.h"

/**
 Implementation of class, Board
 */
@implementation Board

/**
 Implementation of one dynamic property:
 */
@dynamic tileCount;

/**
 Dynamic property, tileCount:
 Returns an integer as a representation
 of how many Tile objects are in field _tiles.
 */
- (NSUInteger) tileCount
{
    return [_tiles count];
}

/**
 Implementation of method, init:
 Defined as the Board class initialiser.
 By default, the _tiles field is initialised
 as a NSMutableArray.
 */
- (id) init
{
    self = [super init];
    if (self != nil)
    {
        _tiles = [[NSMutableArray alloc] initWithCapacity:40];
    }
    return self;
}

/**
 Implementation of method, addTile:
 Passed a parameter as a Tile.
 Passed Tile is then added to the array of tiles,
 or _tiles.
 */
- (void) addTile:(Tile *)t
{
    [_tiles addObject:t];
}

/**
 Implementation of method, tileAtIdx:
 Passed a parameter as an integer.
 Returns the Tile at the passed integer index
 in array _tiles.
 */
- (Tile *) tileAtIdx:(int)idx
{
    return [_tiles objectAtIndex:idx];
}

/**
 Implementation of method, tileNamed:
 Passed a parameter as a NSString.
 Returns the Tile object in _tiles
 with a matching name as passed parameter
 */
- (Tile *) tileNamed:(NSString *)name
{
    for (Tile *t in _tiles)
    {
        if ([t description] == name)
            return t;
    }
    return NULL;
}

/**
 Implementation of linkTile:
 Used to set each tiles _nextTile field so
 that every tile may know which tile comes after
 it. If the Tile is the last Tile on the board,
 tileAt:39, then its _nextTile is the tileAt:0.
 */
-(void) linkTile
{
    for (int i = 0; i < [_tiles count]; i++)
    {
        if (i == [_tiles count] - 1)
        {
            [_tiles[i] setNextTile:_tiles[0]];
        }
        
        else
        {
            [_tiles[i] setNextTile:_tiles[i + 1]];
        }
    }
}
@end

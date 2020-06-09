//
//  JailTile.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "JailTile.h"
#import "Player.h"
/**
 
 */
@implementation JailTile

- (id) initWithName:(NSString *)n
{
    self = [super init];
    if (self != nil)
    {
        _name = n;
        _timeMap = [[NSDictionary alloc] init];
    }
    return self;
}

- (void) move:(Player *)p using:(Dice *)d remainingSteps:(int)n
{
    NSNumber *data = [_timeMap valueForKey:[p name]];
    if (data)
    {
        //locked up
        NSLog(@"locked up");
    }
    //else
    
    [super move:p using:d remainingSteps:n];
}


- (void) lockUp:(Player *)p
{
    [_timeMap setValue:@3 forKey:[p name]];
    [p placeOn:self];
}

@end

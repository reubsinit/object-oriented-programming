//
//  CardHand.m
//  Blackjack
//
//  Created by Andrew Cain on 17/05/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "CardHand.h"

#import "BlackjackHand.h"

@implementation CardHand

-(id) init
{
    if ( self = [super init] )
    {
        _cards = [[NSMutableArray alloc] init];
        _score = 0;
    }
    return self;
}

@synthesize score = _score;
@dynamic count;
@dynamic allFaceUp;

-(int) count
{
    return [_cards count];
}

-(void) returnCards
{
    _score = 0;
    [_cards removeAllObjects];
}

-(void) reveal
{
    for(Card *card in _cards)
    {
        if ( ! [card faceUp] )
        {
            [card turnOver];
        }
    }
}

-(void) conceal
{
    for(Card *card in _cards)
    {
        if ( [card faceUp] )
        {
            [card turnOver];
        }
    }
}

-(BOOL) allFaceUp
{
    for (Card *card in _cards) 
    {
        if ( ! [card faceUp] ) return NO;
    }
    return YES;
}

-(BOOL) needsEvaluate
{
    return NO;
}

-(void) evaluate
{
    _score = 0;
}

-(void) addCard:(Card *)card
{
    [_cards addObject:card];
    
    if ( [self needsEvaluate] )
    {
        [self evaluate];
    }
}

-(void) removeCard:(int) idx
{
    if (idx >= 0 && idx < self.count)
    {
        return [_cards removeObjectAtIndex:idx];
    }
}

-(Card *) cardAt:(int) idx
{
    if (idx >= 0 && idx < self.count)
    {
        return [_cards objectAtIndex:idx];
    }
    else
    {
        return nil;
    }
}

-(NSString *) description
{
    NSMutableString *result;
    result = [[NSMutableString alloc] initWithCapacity:3 * self.count];
    
    for (Card *card in _cards) 
    {
        [result appendFormat:@"%@ ", [card description]];
    }
    
    return result;
}

@end

//
//  Card.m
//  Blackjack
//
//  Created by Andrew Cain on 30/03/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize rank = _rank;
@synthesize suit = _suit;
@synthesize faceUp = _faceUp;
@dynamic aceHighRank;

-(id) initCardRank:(Rank)rank suit:(Suit)suit
{
    if (self = [super init])
    {
        _rank = rank;
        _suit = suit;
        _faceUp = NO;
    }
    
    return self;
}

-(void) turnOver
{
    _faceUp = ! _faceUp;
}

-(Rank) aceHighRank
{
    if (_rank == ACE) return ACE_HIGH;
    else return _rank;
}

-(int) compareTo:(Card *)other
{
    return [self compareTo:other 
               rankAndSuit:YES];
}

-(int) compareTo:(Card *)other rankAndSuit:(BOOL)rs
{
    int result = self.aceHighRank - other.aceHighRank;
    if ( result == 0 && rs ) result = self.suit - other.suit;
    return result;    
}

-(NSString *)description
{
    if (_faceUp)
    {
        NSMutableString *result;
        result = [[NSMutableString alloc] initWithCapacity:2];

        switch (self.rank){
            case JACK:
                [result appendString:@"J"];
                break;
            case QUEEN:
                [result appendString:@"Q"];
                break;
            case KING:
                [result appendString:@"K"];
                break;
            case ACE:
                [result appendString:@"A"];
                break;
            case TEN:
                [result appendString:@"T"];
                break;
            default:
                [result appendFormat:@"%i", self.rank];
        }

        switch (self.suit) {
            case CLUB:
                [result appendString:@"C"];
                break;
            case SPADE:
                [result appendString:@"S"];
                break;
            case HEART:
                [result appendString:@"H"];
                break;
            case DIAMOND:
                [result appendString:@"D"];
                break;
            default:
                [result appendString:@"?"];
        }

        return result;
    }    
    else
    {
        return @"**";
    }
}

@end

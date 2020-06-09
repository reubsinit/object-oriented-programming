//
//  Hand.m
//  Blackjack
//
//  Created by Andrew Cain on 18/04/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "BlackjackHand.h"

#define BLACKJACK 22
#define MAX_CARDS 5

@implementation BlackjackHand

@dynamic full;
@dynamic blackjack;
@dynamic busted;

-(BOOL) needsEvaluate
{
    return self.count >= 2;
}

-(void) evaluate
{
    int aceCount = 0;

    _score = 0;
    
    for (Card *card in _cards) 
    {
        if ( card.rank == ACE) aceCount += 1;
        
        switch (card.rank) {
            case ACE:
                _score += 11;
                break;
            
            case JACK: 
            case QUEEN:
            case KING:
                _score += 10;
                break;
                
            default:
                _score += (int)card.rank;
                break;
        }
    }
    
    while (_score > 21 && aceCount > 0) 
    {
        _score -= 10;
        aceCount --;
    }
    
    if (_score > 21) _score = -1;
    
    if (self.count == 2 && _score == 21) _score = BLACKJACK;
}

-(BOOL) full
{
    return self.count >= MAX_CARDS || [self busted];
}

-(BOOL) blackjack
{
    return _score == BLACKJACK;
}

-(BOOL) busted
{
    return _score == -1;
}

-(NSString *) description
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:[super description]];
    bool allFaceUp = YES;
    
    for (Card *card in _cards) 
    {
        if ( ! [card faceUp] ) allFaceUp = NO;
    }
    
    if ( allFaceUp && [self blackjack] )
    {
        [result appendString:@"BLACKJACK!"];
    }
    
    return result;
}

@end

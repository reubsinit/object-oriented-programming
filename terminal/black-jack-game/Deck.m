//
//  Deck.m
//  Blackjack
//
//  Created by Andrew Cain on 30/03/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(id) init
{
    if (self = [super init]) 
    {
        int i = 0;
        
        for (Suit suit = CLUB; suit <= SPADE; suit++) 
        {
            for (Rank rank = ACE; rank <= KING; rank++) 
            {
                Card *c = [[Card alloc] initCardRank:rank suit:suit];
                _cards[i] = c;
                i++;
            }    
        }
        
        _topCard = 0;
    }
    
    return self;
}

@dynamic cardsRemaining;

-(int) cardsRemaining
{
    return 52 - _topCard;
}

-(Card *) draw
{
    if ( [self cardsRemaining] > 0 ) 
    {
        Card *result = _cards[_topCard];
        _topCard++;
        return result;
    }
    else
    {
        return nil;
    }
}

-(void) shuffle
{
    for(int i = 0; i < 52; i++)
    {
        if(_cards[i].faceUp) [_cards[i] turnOver];
    }

    // for each card (no need to shuffle last card)
    for(int i = 0; i < 52 - 1; i++)
    {
        // pick a random index
        int rndIdx = (int)random() % 52;
        
        Card *temp = _cards[i];
        _cards[i]  = _cards[rndIdx];
        _cards[rndIdx] = temp;
    }
    
    _topCard = 0;
}


@end

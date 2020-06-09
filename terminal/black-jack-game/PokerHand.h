//
//  PokerHand.h
//  Blackjack
//
//  Created by Andrew Cain on 17/05/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CardHand.h"
#import "Card.h"

typedef struct card_freq
{
    int   count;
    Rank  rank;
} card_freq;

@interface PokerHand : CardHand
{
//    NSMutableArray  * _sorted;
    card_freq         _cardFreq[13];
}

//-(id) init;

-(NSString *) description;

-(int) compareTo:(PokerHand *)other;

@end

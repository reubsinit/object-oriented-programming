//
//  Deck.h
//  Blackjack
//
//  Created by Andrew Cain on 30/03/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface Deck : NSObject
{
    Card *  _cards[52];
    int     _topCard;
}

-(id) init;

@property (readonly) int cardsRemaining;

-(Card *) draw;

-(void) shuffle;

@end

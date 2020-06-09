//
//  BlackjackGame.h
//  Blackjack
//
//  Created by Andrew Cain on 18/04/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "BlackjackHand.h"

@interface BlackjackGame : NSObject
{
    Deck *              _deck;
    BlackjackHand *     _dealerHand;
    BlackjackHand *     _playerHand;
}

-(id) initBlackjackGame;

@property (readonly) BlackjackHand *dealer;
@property (readonly) BlackjackHand *currentPlayer;
@property (readonly) BOOL playerWon;

-(void)start;
-(void)hit;
-(void)stand;


@end

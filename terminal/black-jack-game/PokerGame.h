//
//  PokerGame.h
//  Blackjack
//
//  Created by Andrew Cain on 17/05/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PokerHand.h"
#import "Deck.h"

@interface PokerGame : NSObject
{
    Deck *      _deck;
    NSArray *   _players;
    PokerHand * _winner;
    int         _currentPlayer;
    BOOL        _waitingForPlayer;
    BOOL        _gameOver;
}

-(id) initPokerGame:(int)players;

@property (readonly) PokerHand *currentPlayer;
@property (readonly) PokerHand *winner;
@property (readonly) BOOL gameOver;

-(PokerHand *)player:(int)idx;

-(void)start;
-(void)ready;
-(void)done;

@end

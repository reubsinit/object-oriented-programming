//
//  BlackjackGame.m
//  Blackjack
//
//  Created by Andrew Cain on 18/04/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "BlackjackGame.h"

@implementation BlackjackGame

-(id) initBlackjackGame;
{
    if ( self = [super init])
    {
        _deck = [[Deck alloc] init];
        _playerHand = [[BlackjackHand alloc] init];
        _dealerHand = [[BlackjackHand alloc] init];
        
    }
    return self;
}

@synthesize dealer = _dealerHand;
@synthesize currentPlayer = _playerHand;
@dynamic    playerWon;

-(void) dealCardTo:(BlackjackHand *)hand faceUp:(BOOL)flip
{
    if ([hand full])return;
    
    Card *topCard = [_deck draw];
    if (flip) {
        [topCard turnOver];
    }
    
    [hand addCard:topCard];    
}

-(void) start
{
    [_playerHand returnCards];
    [_dealerHand returnCards];
    
    [_deck shuffle];
    
    // Deal 1 to each player
    [self dealCardTo:_playerHand faceUp:YES];
    
    // Deal 1 to dealer
    [self dealCardTo:_dealerHand faceUp:NO];

    // Deal 1 more to each player
    [self dealCardTo:_playerHand faceUp:YES];

    // Deal 1 more to dealer (face up)
    [self dealCardTo:_dealerHand faceUp:YES];
}

-(void) hit
{
    [self dealCardTo:[self currentPlayer] faceUp:YES];
    
    if ([[self currentPlayer] busted] || [[self currentPlayer] full]) {
        // Busted or Full... do stand logic
        [self stand];
    }
}

-(void) stand
{
    // Player has ended their turn.
    
    // If last player done then...
    [_dealerHand reveal];
    
    while ([_dealerHand score] < 17 && ! [_dealerHand full] ) 
    {
        [self dealCardTo:_dealerHand faceUp: YES];
    }
}

-(BOOL)playerWon
{
    return [_playerHand score] > [_dealerHand score];
}

@end

//
//  PokerGame.m
//  Blackjack
//
//  Created by Andrew Cain on 17/05/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "PokerGame.h"

@implementation PokerGame

-(id) initPokerGame:(int)players
{
    if ( self = [super init])
    {
        _deck = [[Deck alloc] init];
        NSMutableArray *tmp = [[NSMutableArray alloc] initWithCapacity:players];
        
        for (int i = 0; i < players; i++) 
        {
            [tmp addObject:[[PokerHand alloc] init]];
        }
        
        _players = [[NSArray alloc] initWithArray:tmp];
        _waitingForPlayer = NO;
        _winner = nil;
        _currentPlayer = 0;
    }
    return self;
}

@dynamic currentPlayer;
@synthesize gameOver = _gameOver;
@synthesize winner = _winner;

-(void) dealCardTo:(PokerHand *)hand faceUp:(BOOL)flip
{
    if ([hand count] >= 5) return;
    
    Card *topCard = [_deck draw];
    if (flip) {
        [topCard turnOver];
    }
    
    [hand addCard:topCard];    
}

-(PokerHand *)currentPlayer
{
    return [_players objectAtIndex:_currentPlayer];
}

-(PokerHand *)player:(int)idx
{
    return [_players objectAtIndex:idx];
}

-(void)start
{
    [_deck shuffle];
    
    _winner = nil;
    _waitingForPlayer = YES;
    _currentPlayer = 0;
    _gameOver = NO;
    
    for (PokerHand *hand in _players) 
    {
        [hand returnCards];
    }
    
    for (int i = 0; i < 5 * [_players count]; i++) 
    {
        [self dealCardTo:[_players objectAtIndex:i % [_players count] ] faceUp:NO];
    }
}

-(void) ready
{
    _waitingForPlayer = YES;
    [[_players objectAtIndex:_currentPlayer] reveal];
}

-(void) determineWinner
{
    _winner = [_players objectAtIndex:0];
    for (int i = 1; i < [_players count]; i++) 
    {
        PokerHand *other = [_players objectAtIndex:i];
        if ( [_winner compareTo: other] < 0 ) _winner = other;
    }
    
}

-(void)done
{
    [[_players objectAtIndex:_currentPlayer] conceal];
    _currentPlayer++;
    
    if ( _currentPlayer >= [_players count] )
    {
        // Finished round
        for (PokerHand *hand in _players)
        {
            while ( hand.count < 5 )
            {
                [self dealCardTo:hand 
                          faceUp:NO ];
            }
            
            [hand reveal];
        }
        
        _currentPlayer = 0;
        _gameOver = YES;
        [self determineWinner];
    }
    
}


@end

//
//  Card.h
//  Blackjack
//
//  Created by Andrew Cain on 30/03/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Suit {
    CLUB,
    DIAMOND,
    HEART,
    SPADE
} Suit;

#define ACE_HIGH 14

typedef enum Rank {
    ACE = 1,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX,
    SEVEN,
    EIGHT,
    NINE,
    TEN,
    JACK,
    QUEEN,
    KING
} Rank;



@interface Card : NSObject
{
    // Instance variables
    Suit _suit;
    Rank _rank;
    BOOL _faceUp;
}


@property (readonly) Rank rank;
@property (readonly) Rank aceHighRank;
@property (readonly) Suit suit;
@property (readonly) BOOL faceUp;

-(id) initCardRank:(Rank)rank suit:(Suit)suit;

-(void) turnOver;
-(int) compareTo:(Card *)other;
-(int) compareTo:(Card *)other rankAndSuit:(BOOL)rs;

-(NSString *)description;


@end

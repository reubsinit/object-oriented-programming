//
//  CardHand.h
//  Blackjack
//
//  Created by Andrew Cain on 17/05/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardHand : NSObject
{
    NSMutableArray *    _cards;
    int                 _score;
}

-(id) init;

@property (readonly) int    score;
@property (readonly) int    count;
@property (readonly) BOOL   allFaceUp;

-(void) returnCards;
-(void) addCard:(Card *) card;
-(void) removeCard:(int) idx;

-(void) reveal;
-(void) conceal;

-(Card *) cardAt:(int) idx;
-(NSString *) description;

@end

//
//  Hand.h
//  Blackjack
//
//  Created by Andrew Cain on 18/04/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardHand.h"
#import "Card.h"

@interface BlackjackHand : CardHand

@property (readonly) BOOL   full;
@property (readonly) BOOL   blackjack;
@property (readonly) BOOL   busted;

-(NSString *) description;

@end

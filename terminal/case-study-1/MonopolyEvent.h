//
//  MonopolyEvent.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
@class Player;
@class Tile;
@class Dice;
@class Die;


/**
 Declaration of class, MonopolyEvent with fields:
 _player    as a Player. Required to know which Player object is involved with an event
 _object    as a NSObject. Required to know which game related object is involved with an event
 _desc      as a NSString. Required to store a descriptive string in relation to the event
 */
@interface MonopolyEvent : NSObject
{
    Player      *_player;
    NSObject    *_object;
    NSString    *_description;
}
 /**
  Declaration of one class assistive property:
  description   as a readonly getter - returns a NSString
  */
@property (readonly) NSString * description;

/**
 Declaration of class initialiser and four variant initialisers:
 init                   takes three parameters as a Player, NSObject, NSString
 newDiceEvent           takes two parameters as a Player and Dice - returns a MonopolyEvent
 newLandEvent           takes two parameters as a Player and Tile - returns a MonopolyEvent
 newTransactionEvent    takes two parameters as a Player and Action - returns a MonopolyEvent
 newMoveActionEvent     takes two parameters as a Player and Action - returns a MonopolyEvent
 */

- (id) initWithPlayer:(Player *)p objectKind:(NSObject *)o description:(NSString *)d;
+ (MonopolyEvent *) newDiceEventFor:(Player *)p using:(Dice *)d;
+ (MonopolyEvent *) newLandEventFor:(Player *)p landingOn:(Tile *)t;
+ (MonopolyEvent *) newTransactionEventFor:(Player *)p withAction:(NSObject <Action> *)a;
+ (MonopolyEvent *) newMoveActionEventFor:(Player *)p withAction:(NSObject <Action> *)a;

@end

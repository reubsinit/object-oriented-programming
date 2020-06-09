//
//  Player.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"
#import "IHaveInventory.h"
@class Inventory;
@class Item;

/**
 Declaration of class, Player with field:
 _inventory     as a Inventory. Required for the Player to acquire a list of Item objects
 Player inherits from class GameObject
 */
@interface Player : GameObject <IHaveInventory>
{
    Inventory   *_inventory;
}

/**
 Declaration of two class assistive properties:
 inventory          as a readonly getter - returns an Inventory
 fullDescription    as a readonly getter - returns a NSString
 */
@property (readonly) Inventory *inventory;
@property (readonly) NSString *fullDescription;

/**
 Declaration of two class assistive methods:
 initWithName       takes two parameters as NSString
 locate             takes a parameter as a NSString - returns a GameObject
 */
- (id) initWithName:(NSString *)name andDesc:(NSString *)desc;


@end

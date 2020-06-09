//
//  Bag.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 20/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "IHaveInventory.h"
@class Inventory;
@class GameObject;

/**
 Declaration of class, Bag with field:
 _inventory     as a Inventory. Required for the Bag to acquire a list of Item objects
 */
@interface Bag : Item <IHaveInventory>
{
    Inventory *_inventory;
}

/**
 Declaration of two class assistive properties:
 inventory      as a readonly getter - returns an Inventory
fullDescription    as a readonly getter - returns a NSString
 */
@property (readonly) Inventory * inventory;
@property (readonly) NSString *fullDescription;

/**
 Declaration of two class assistive methods:
 initWithIdentifiers:   takes three parameters as a NSArray and two NSString
 locate             takes a parameter as a NSString - returns a GameObject
 */
- (id) initWithIdentifiers:(NSArray *)idents name:(NSString *)name andDesc:(NSString *)desc;

@end

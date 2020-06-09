//
//  Inventory.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
@class Item;
@class IdentifiableObject;

/**
 Declaration of class, Inventory with fields:
 _items     as a NSMutableArray. Required to store Item objects
 */
@interface Inventory : NSObject
{
    NSMutableArray *_items;
}

/**
 Declaration of six class assistive methods:
 init
 put            takes a parameter as an Item
 hasItem        takes a parameter as a NSString - returns a BOOL
 fetchItem      takes a parameter as a NSString - returns an Item
 takeItem       takes a parameter as a NSString - returns an Item
 itemList       returns a NSString
 */
- (id) init;
- (void) put:(Item *)item;
- (BOOL) hasItem:(NSString *)ident;
- (Item *) fetchItem:(NSString *)ident;
- (Item *) takeItem:(NSString *)ident;
- (NSString *) itemList;

@end

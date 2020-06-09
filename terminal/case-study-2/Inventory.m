//
//  Inventory.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "Inventory.h"
#import "Item.h"
#import "IdentifiableObject.h"

/**
 Implementation of class, Inventory
 */
@implementation Inventory

/**
 Implementation of method, init:
 Defined as the class initialiser.
 By default, field _items is
 initialised as a NSMutableArray
 */
- (id) init
{
    self = [super init];
    if (self != nil)
    {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

/**
 Implementation of method, put:
 Passed a parameter as an Item.
 Passed Item is added to array _items
 */
- (void) put:(Item *)item
{
    [_items addObject:item];
}

/**
 Implementation of method, hasItem:
 Passed a parameter as a NSString.
 Returns a BOOL.
 Loops over each Item in array _items,
 Item method areYou is used with passed parameter
 to determine if such an item exists; if so return true
 */
- (BOOL) hasItem:(NSString *)ident
{
    for (Item *i in _items)
    {
        if ([i areYou:ident] == true)
        {
            return true;
            break;
        }
    }
    return false;
}

/**
 Implementation of method, fetchItem:
 Passed a parameter as a NSString.
 Returns an Item.
 Loops over each Item in array _items,
 Item method areYou is used with passed parameter
 to determine if such an item exists; if so return that item
 */
- (Item *) fetchItem:(NSString *)ident
{
    for (Item *i in _items)
    {
        if ([i areYou:ident])
        {
            return i;
        }
    }
    
    return nil;
}

/**
 Implementation of method, takeItem:
 Passed a parameter as a NSString.
 Returns an Item.
 Loops over each Item in array _items,
 Item method areYou is used with passed parameter
 to determine if such an item exists; if so return that item
 and remove it from the array _items
 */
- (Item *) takeItem:(NSString *)ident
{
    for (Item *i in _items)
    {
        if ([i areYou:ident])
        {
            [_items removeObject:i];
            return i;
        }
    }
    return NULL;
}

/**
 Implementation of method, itemList:
 Passed a parameter as a NSString.
 Returns a NSString.
 Loops over each Item in array _items,
 and generates a descriptive item list with
 each Item firstId and name.
 List is returned.
 */
- (NSString *) itemList
{
    NSString *list = [[NSString alloc] init];
    for (Item *i in _items)
    {
        list = [list stringByAppendingFormat:@"     %@: %@.\n", [i firstId], [i name]];
    }
    return list;
}

@end

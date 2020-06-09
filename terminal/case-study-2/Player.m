//
//  Player.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "Player.h"
#import "Inventory.h"
#import "Item.h"

/**
 Implementation of class, Player
 */
@implementation Player

/**
 Implementation of three class assistive properties:
 inventory          returns value stored in _inventory
 fullDescription    dynamic property
 */
@synthesize inventory = _inventory;
@dynamic fullDescription;

/**
 Implementation of dynamic property, fullDescription:
 Returns a NSString.
 Creates a descriptive list of the items the Player has
 in Inventory using the Inventory method itemList
 */
- (NSString *) fullDescription
{
    return [NSString stringWithFormat:@"You are carrying:\n%@", [_inventory itemList]];
}

/**
 Implementation of method, initWithName:
 Defined as the class initialiser.
 Passed two parameters as NSString.
 By defualt, _inventory is initialised as an Inventory
 _identifiers is initialised with a NSArray with ids that
 identify the Player
 */
- (id) initWithName:(NSString *)name andDesc:(NSString *)desc
{
    self = [super init];
    if (self != nil)
    {
        _name = name;
        _description = desc;
        _inventory = [[Inventory alloc] init];
        _identifiers = [[NSMutableArray alloc] initWithArray:@[@"me", @"inventory"]];
    }
    return self;
}

/**
 Implementation of method, locate:
 Passed a parameter as a NSString.
 Returns a GameObject.
 Method checks to see if the passed NSString
 identifies the Player, if so, Player is returned
 else checks to see if passed NSString identifies
 an Item, if so, Item is returned
 else returns null GameObject.
 */
- (GameObject *) locate:(NSString *)ident
{
    if ([self areYou:ident])
    {
        return self;
    }
    else
    {
        return [_inventory fetchItem:ident];
    }
}

@end

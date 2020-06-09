//
//  Bag.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 20/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "Bag.h"
#import "Inventory.h"

/**
 Implementation of class, Bag
 */
@implementation Bag

/**
 Implementation of two class assistive property:
 inventory          returns value stored in _inventory
 fullDescription    dynamic property
 */
@synthesize inventory = _inventory;

@dynamic fullDescription;

/**
 Implementation of dynamic property, fullDescription:
 Returns a NSString.
 Creates a descriptive list of the items the Bag has
 in Inventory using the Inventory method itemList
 */
- (NSString *) fullDescription
{
    return [NSString stringWithFormat:@"In the %@ you can see:\n%@",[self name], [_inventory itemList]];
}

/**
 Implementation of method initWithIdentifiers:
 Defined as the class initialiser.
 Passed three parameters as a NSArray and two NSString.
 By default, inherited field is initialised with the passed array,
 _name and _description are assigned the passed parameter
 values.
 _inventory is initialised as an Inventory
 */
- (id) initWithIdentifiers:(NSArray *)idents name:(NSString *)name andDesc:(NSString *)desc
{
    self = [super init];
    if (self != nil)
    {
        _identifiers = [[NSMutableArray alloc] initWithArray:idents];
        _name = name;
        _description = desc;
        _inventory = [[Inventory alloc] init];
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

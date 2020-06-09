//
//  IdentifiableObject.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 2/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "IdentifiableObject.h"

/**
 Implementation of class, IdentifiableObject
 */
@implementation IdentifiableObject

/**
 Implementation of one dynamic property:
 */
@dynamic firstId;

/**
 Dynamic property, firstId:
 Returns the first object in the array of identifiers,
 or _identifiers. Property returns a NSString.
 */
- (NSString *) firstId
{
    return [_identifiers firstObject];
}

/**
 Implementation of initWithIdentifiers:
 Passed a parameter as a NSArray.
 Defined as the class initialiser.
 By default, the field _identifiers is
 initialised as a NSMutableArry. Each object
 in the passed NSArray idents is then added to the
 _identifiers array.
 */
- (id) initWithIdentifiers:(NSArray *)idents
{
    self = [super init];
    if (self != nil)
    {
        _identifiers = [[NSMutableArray alloc] init];
        for (id object in idents)
        {
            [_identifiers addObject:[object lowercaseString]];
        }
    }
    return self;
}

/**
 Implementation of areYou:
 Passed a parameter as a NSString.
 Returns a BOOL.
 Used to check each object in the array _identifiers
 against the passed parameter, ident.
 This method does not require ident to be case sensitive,
 it is converted to lowercase.
 */
- (BOOL) areYou:(NSString *)ident
{
    for (int i = 0; i < [_identifiers count]; i++)
    {
        if ([[_identifiers objectAtIndex:i] isEqualToString:[ident lowercaseString]])
            return true;
    }
    return false;
}

/**
 Implementation of addIdentifier:
 Passed a parameter as a NSString.
 The passed parameter, ident is converted
 to lowercase and then added to the array _identifiers.
 */
- (void) addIdentifier:(NSString *)ident
{
    [_identifiers addObject:[ident lowercaseString]];
}

@end

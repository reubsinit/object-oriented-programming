//
//  GameObject.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "GameObject.h"

/**
 Implementation of class, GameObject
 */
@implementation GameObject
/**
 Implementation of one synthesized property and two dynamic properties:
 Synthesized property name returns value stored in _name
 */
@synthesize name = _name;
@dynamic shortDescription;
@dynamic fullDescription;

/**
 Implementation of dynamic property, shortDescription:
 Returns a NSString with format, representing firstId and 
 instance _name.
 */
- (NSString *) shortDescription
{
    return [NSString stringWithFormat:@"%@: %@.", [self firstId], _name];
}

/**
 Implementation of dynamic property, fullDescription:
 Returns a NSString with format, representing firstId, _name and
 _description.
 */
- (NSString *) fullDescription
{
    return [NSString stringWithFormat:@"%@: %@. %@.", [self firstId], _name, _description];
}

/**
 Implementation of method initWithIdentifiers:
 Defined as the class initialiser.
 Passed three parameters as a NSArray and two NSString.
 By default, inherited field is initialised with the passed array,
 _name and _description are assigned the passed parameter
 values.
 */
- (id) initWithIdentifiers:(NSArray *)idents name:(NSString *)name andDesc:(NSString *)desc
{
    self = [super init];
    if (self != nil)
    {
        _identifiers = [[NSMutableArray alloc] initWithArray:idents];
        _name = name;
        _description = desc;
    }
    return self;
}

@end

//
//  GameObject.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IdentifiableObject.h"

/**
 Declaration of class, GameObject with fields:
 _name          as a NSString. Required to store a descriptive name
 _description   as a NSString. Required to store a description of GameObject
 This class inherits functionality from IdentifiableObject
 */
@interface GameObject : IdentifiableObject
{
    NSString    *_name;
    NSString    *_description;
}

/**
 Declaration of three class assistive properties:
 name               as a readonly getter - returns a NSString
 shortDescription    as a readonly getter - returns a NSString
 fullDescription     as a readonly getter - returns a NSString
 */
@property (readonly) NSString *name;
@property (readonly) NSString *shortDescription;
@property (readonly) NSString *fullDescription;

/**
 Declaration of one class assistive method:
 initWithIdentifiers:   takes three parameters as a NSArray and two NSString
 */
- (id) initWithIdentifiers:(NSArray *)idents name:(NSString *)name andDesc:(NSString *)desc;

@end

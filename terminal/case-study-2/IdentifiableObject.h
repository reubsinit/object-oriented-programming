//
//  IdentifiableObject.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 2/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Declaration of class, IdentifiableObject with field:
 _identifiers   as an NSMutableArry. Required to store each required identifier
 */
@interface IdentifiableObject : NSObject
{
    NSMutableArray  *_identifiers;
}

/**
 Declaration of one class assistive property:
 firstId    as a readonly getter - returns a NSString
 */
@property (readonly) NSString * firstId;

/**
 Declaration of three class assistive methods:
 initWithIdentifiers:       takes a NSArray as a parameter
 areYou:                    takes a NSString as a parameter - returns a NSString
 addIdentifier:             takes a NSString as a parameter
 */
- (id) initWithIdentifiers:(NSArray *)idents;
- (BOOL) areYou:(NSString *)ident;
- (void) addIdentifier:(NSString *)ident;

@end

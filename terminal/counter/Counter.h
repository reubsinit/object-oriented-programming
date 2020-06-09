//
//  Counter.h
//  Counter
//
//  Created by Reuben Wilson on 14/08/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 Declaration of class, Counter.
 Class contains one field:
 _count:     as an integer
 */
@interface Counter : NSObject
{
    int _count;
}

/**
 Declaration of one class assistive property:
 count    as a getter/setter
 */
@property (readwrite, assign) int count;

/**
 Declaration of three class assistive methods:
 increment
 reset
 */
- (void) increment;
- (void) reset;


@end

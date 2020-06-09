//
//  JailAction.m
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import "JailAction.h"
#import "JailTile.h"

@implementation JailAction

- (id) initWithJailTile:(JailTile *)t
{
    self = [super init];
    if (self != nil)
    {
        _jailTile = t;
    }
    return self;
}

- (void) perform:(Player *)p
{
    [_jailTile lockUp:p];
}

@end

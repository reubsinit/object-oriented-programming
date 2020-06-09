//
//  JailAction.h
//  CaseStudy1
//
//  Created by Reuben Wilson on 29/09/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
@class JailTile;

@interface JailAction : NSObject <Action>
{
    JailTile    *_jailTile;
}

- (id) initWithJailTile:(JailTile *)t;
- (void) perform:(Player *)p;

@end

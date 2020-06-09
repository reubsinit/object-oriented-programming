//
//  Command.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 20/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "Command.h"

/**
 Implementation of abstract class, Command.
 Methods are not implemented in this class, rather
 they are implemented by child classes
 */
@implementation Command

-(NSString *) execute:(Player *)p command:(NSArray *)text
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end

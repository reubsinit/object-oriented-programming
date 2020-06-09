//
//  IHaveInventory.h
//  CaseStudy2
//
//  Created by Reuben Wilson on 20/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameObject;

@protocol IHaveInventory

@property (readonly) NSString * name;
-(GameObject *) locate:(NSString *)ident;

@end

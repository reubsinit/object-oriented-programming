//
//  LookCommand.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 20/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "LookCommand.h"
#import "Command.h"
#import "Inventory.h"
#import "Player.h"
#import "IHaveInventory.h"
#import "Item.h"
#import "Bag.h"
/**
 Declaration of private class method:
 player: lookAt: in:    takes three parameters as a Player and two NSString - returns a NSString
 */
@interface LookCommand (Private)
-(NSString *) player:(Player *)p lookAt:(NSString *)ident in:(NSString *)container;
@end

/**
 Implementation of class, LookCommand
 */
@implementation LookCommand

/**
 Implementation of method execute: command:
 Passed two parameters as a Player and a NSArray.
 Returns a NSString.
 A switch statement is implemented to detect the length of the passed
 array and branch off accordingly. If statements in each branch
 are implemented to detect whether or not the combination
 of NSString in the passed NSArray can perfom a certain task, if
 so that particular task is executed. Otherwise, meaningful
 error messages are produced to inform the user of ill input.
 */
-(NSString *) execute:(Player *)p command:(NSArray *)text
{
    switch ([text count]) {
        case 3:
            if ([[text objectAtIndex:0] isEqualToString:@"look"] && [[text objectAtIndex:1] isEqualToString:@"at"])
            {
                return [self player:p lookAt:[text objectAtIndex:2] in:@"inventory"];
            }
            else if ([[text objectAtIndex:0] isEqualToString:@"look"] && ![[text objectAtIndex:1] isEqualToString:@"at"])
            {
                return @"What is it you want to look at?\n";
            }
            break;
            
        case 5:
            if ([[text objectAtIndex:0] isEqualToString:@"look"] && [[text objectAtIndex:1] isEqualToString:@"at"] && [[text objectAtIndex:3] isEqualToString:@"in"])
            {
                return [self player:p lookAt:[text objectAtIndex:2] in:[text objectAtIndex:4]];
            }
            else if ([[text objectAtIndex:0] isEqualToString:@"look"] && [[text objectAtIndex:1] isEqualToString:@"at"] && ![[text objectAtIndex:3] isEqualToString:@"in"])
            {
                return @"What is it you want to look in?\n";
            }
            else if ([[text objectAtIndex:0] isEqualToString:@"look"] && ![[text objectAtIndex:1] isEqualToString:@"at"])
            {
                return @"What is it you want to look at?\n";;
            }
            break;
        default:
            if ([[text objectAtIndex:0] isEqualToString:@"look"])
            {
                return @"I don't know how to look like that...\n";
            }
            else
            {
                return @"Error in look input...\n";
            }

            break;
    }
    return nil;
}

@end

/**
 Implementation of private methods:
 */
@implementation LookCommand (Private)

/**
 Implementation of method, player: lookAt: in:
 Passed three parameters as a Player and two NSString.
 Returns a NSString.
 The passed parameter ident is the Item object wanted to locate.
 The passed parameter container is the container, or Item with an Inventory in
 which the Item ident needs to be located in.
 Also generates useful error messages which inform of the lack of pressence
 of the wanted container, wanted item or wanted Item in wanted container
 */
-(NSString *) player:(Player *)p lookAt:(NSString *)ident in:(NSString *)container
{
    if ([ident isEqualToString:@"inventory"] || [ident isEqualToString:@"me"])
    {
        return [p fullDescription];
    }
    
    else if (([container isEqualToString:@"inventory"] || [container isEqualToString:@"me"])  && [[p inventory] hasItem:ident])
    {
        return [[p locate:ident] fullDescription];
    }
    
    else if (([container isEqualToString:@"inventory"] || [container isEqualToString:@"me"]) && ![[p inventory] hasItem:ident])
    {
        return [NSString stringWithFormat:@"I can't find the %@...\n", ident];
    }

    else if ([[p inventory] hasItem:container])
    {
        Bag <IHaveInventory> *cont;
        Item *tempContainer = [[p inventory] fetchItem:container];
        if ([tempContainer conformsToProtocol:@protocol(IHaveInventory)])
        {
            cont = (Bag <IHaveInventory> *) tempContainer;
            if ([[cont inventory] hasItem:ident])
            {
                return [[cont locate:ident] fullDescription];
            }
            else
            {
                return [NSString stringWithFormat:@"I can't find the %@ in the %@...\n", ident, container];
            }
        }
            
    }
    else
    {
        return [NSString stringWithFormat:@"I can't find the %@...\n", container];
    }

    return @"...";
}

@end

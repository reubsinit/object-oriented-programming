//
//  main.m
//  CaseStudy2
//
//  Created by Reuben Wilson on 9/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Item.h"
#import "Bag.h"
#import "Inventory.h"
#import "LookCommand.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        BOOL running = true;
        char choice = '\0';
        char command[50];
        char playerName[50];
        char playerDesc[50];
        NSLog(@"Enter your name: ");
        fgets(playerName, sizeof playerName, stdin);
        NSLog(@"Enter your description: ");
        fgets(playerDesc, sizeof playerDesc, stdin);
        
        LookCommand *lookCommand = [[LookCommand alloc] init];
        
        
        Player *player = [[Player alloc] initWithName:
                          [[NSString stringWithCString:playerName encoding:NSUTF8StringEncoding]
                           stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                              andDesc:[[NSString stringWithCString:playerDesc encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        
        Item *item1 = [[Item alloc] initWithIdentifiers:@[@"dagger", @"blade"] name:@"Sting" andDesc:@"Sharp as a wolverine's tooth"];
        Item *item2 = [[Item alloc] initWithIdentifiers:@[@"rope"] name:@"Dalla's rope" andDesc:@"Said to have held together Dalla's life for a long time"];
        Item *item3 = [[Item alloc] initWithIdentifiers:@[@"gem"] name:@"Yan's gem" andDesc:@"Yan used this gem to steal souls"];
        Bag *bag1 = [[Bag alloc] initWithIdentifiers:@[@"bag", @"satchel"] name:@"Slime covered bag" andDesc:@"Who knows where this has been"];
        [[bag1 inventory] put:item3];
        
        [[player inventory] put:item1];
        [[player inventory] put:item2];
        [[player inventory] put:bag1];
        
        while (running)
        {
            NSLog(@"Command: ");
            fgets(command, sizeof command, stdin);
            NSString *convertedChar = [[NSString stringWithCString:command encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSArray *userCommand = [convertedChar componentsSeparatedByString:@" "];
            
            NSLog(@"%@", [lookCommand execute:player command:userCommand]);
        }
        
    }
    return 0;
}


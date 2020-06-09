//
//  main.m
//  Counter
//
//  Created by Reuben Wilson on 14/08/2013.
//  Copyright (c) 2013 Reuben Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Counter.h"

/**
 Declaration of the main:
 */
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        /**
         Initialise three instances of class, Counter
         */
        Counter *c1 = [[Counter alloc] init];
        Counter *c2 = [[Counter alloc] init];
        Counter *c3 = [[Counter alloc] init];
        
        /**
         Call Counter class method setCount on
         Counter objects:
         c1
         c2
         c3
         */
        [c1 setCount:0];
        [c2 setCount:0];
        [c3 setCount:0];
        
        /**
         Use a while loop to loop while the value returned by calling the method count on c1 is less than 5. For each loop, call the method increment on c1.
         */
        
        while ([c1 count] < 5)
        {
            [c1 increment];
        }
        printf("Count is %d\n", [c1 count]);
        
        /**
         Use a while loop to loop while the value returned by calling the method count on c2 is less than 10. For each loop, call the method increment on c2.
         */
        while ([c2 count] < 10)
        {
            [c2 increment];
        }
        printf("Count is %d\n", [c2 count]);

        /**
         Use a for loop for the duration of 
         the value returned by calling method count on c3 is less than 15. For each loop, call the increment method on c3.
         */
        for (int i = 0; [c3 count] < 15; i++)
        {
            [c3 increment];
        }
    
        printf("Count is %d\n", [c3 count]);
        
    }
    return 0;
}


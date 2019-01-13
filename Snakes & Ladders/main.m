//
//  main.m
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL keepPlaying = YES;
        NSString *prompt = @"To play snakes and ladders, type roll (or r): ";
        char input[255];
        NSString *userInput;
        
        while(YES == keepPlaying){
            NSLog(@"%@", prompt);
            fgets(input, 255, stdin);
            userInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            
            NSString *trimmedString = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            
            if(([trimmedString isEqualToString:@"r\n"]) ||
               ([trimmedString isEqualToString:@"roll\n"]))
            {
                NSLog(@"you typed %@", userInput);
            }
            
        }
        
        
        
    }
    return 0;
}

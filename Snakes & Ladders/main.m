//
//  main.m
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerManager.h"

void IFPrint (NSString *format, ...) {
    va_list args;
    va_start(args, format);
    
    fputs([[[NSString alloc] initWithFormat:format arguments:args] UTF8String], stdout);
    
    va_end(args);
}

void instantiatePlayers(PlayerManager **playerManager){
    NSString *numPlayersPrompt = @"How many players? ";
    NSString *playerNamePrompt = @"Name of player ";
    char input[255];
    NSString *userInput;
    // Player *player = [[Player alloc] init];
    
    
    
    while(YES){
        
        NSLog(@"%@", numPlayersPrompt);
        fgets(input, 255, stdin);
        
        
        userInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
        
        NSString *trimmedString = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        int numPlayers = [trimmedString intValue];
        
        if(numPlayers == 0){
            NSLog(@"invalid number; pick a number 1 - 10");
            continue;
        }
        
        for(int i = 0; i < numPlayers; i++){
            
            NSLog(@"%@%d> ", playerNamePrompt, i);
            fgets(input, 255, stdin);
            userInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            // [player setName:userInput];
            [*playerManager createPlayer:userInput];
            //            [[*playerManager players] addObject:player];
            NSLog(@"adding player number %d <%@>", i, userInput);
        }
        NSLog(@"...finished adding players to player list...");
        break;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL stop = NO;
        
        while(NO == stop){
            
            //Player *player = [[Player alloc] init];
            PlayerManager *playerManager = [[PlayerManager alloc] init];
            
            instantiatePlayers(&playerManager);
            
            char input[255];
            NSString *userInput;
            NSString *playGamePrompt = [NSString stringWithFormat:@"\nPlayer %@, type roll (or r) or quit: ", [[playerManager currentPlayer] name]];
            
            
            
            //Player *player = [[Player alloc] init];
            //player = [[playerManager players] objectAtIndex:0];
            
            
            
            //while(NO == [[playerManager currentPlayer] gameOver]){
            while(NO == stop){
                playGamePrompt = [NSString stringWithFormat:@"\nPlayer %@, type roll (or r) or quit: ", [[playerManager currentPlayer] name]];
                NSLog(@"%@", playGamePrompt);
                fgets(input, 255, stdin);
                userInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
                
                NSMutableString *trimmedString = (NSMutableString *)[userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                
                trimmedString = (NSMutableString *)[trimmedString lowercaseString];
                
                
                if(([trimmedString isEqualToString:@"r\n"]) ||
                   ([trimmedString isEqualToString:@"roll\n"]))
                {
                    // NSLog(@"you typed %@", userInput);
                    [playerManager roll];
                    IFPrint(@"%@",[playerManager score]);
                    
                    if([[playerManager currentPlayer] currentSquare] >= 100){
                        [[playerManager currentPlayer] setGameOver:YES];
                        NSLog(@"game is over: %@ wins!", [[playerManager currentPlayer] name]);
                        
                        // release all players
                        [[playerManager currentPlayer] setGameOver:NO];
                        
                        [[playerManager players] removeAllObjects];
                        
                        //continue;
                        break;
                    }
                }else if([trimmedString isEqualToString:@"quit\n"]){
                    
                    char answer[255];
                    NSLog(@"Quit? or Restart? ");
                    fgets(answer, 255, stdin);
                    
                    NSString *userAnswer = [NSString stringWithCString:answer encoding:NSUTF8StringEncoding];
                    
                    NSMutableString *trimmedAnswer = (NSMutableString *)[userAnswer stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                    
                    trimmedAnswer = (NSMutableString *)[trimmedAnswer lowercaseString];
                    
                    if([trimmedAnswer isEqualToString:@"quit\n"]){
                    
                        NSLog(@"You chose to quit. Bye.");
                        stop = YES;
                        
                    }else if([trimmedAnswer isEqualToString:@"restart\n"]){
                        NSLog(@"You chose to restart.");
                        break;
                    }else{
                        NSLog(@"Error. Goodbye.");
                        stop = YES;
                    }
                }
                
            }
        }
        
        
    }
    return 0;
}

//
//  main.m
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerManager.h"

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
        
        NSString *playGamePrompt = @"To play snakes and ladders, type roll (or r): ";
        char input[255];
        NSString *userInput;
        //Player *player = [[Player alloc] init];
        PlayerManager *playerManager = [[PlayerManager alloc] init];
        
        instantiatePlayers(&playerManager);
        
        //Player *player = [[Player alloc] init];
        //player = [[playerManager players] objectAtIndex:0];
        
        
        
        while(NO == [[playerManager currentPlayer] gameOver]){
            NSLog(@"%@", playGamePrompt);
            fgets(input, 255, stdin);
            userInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            
            NSString *trimmedString = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            
            if(([trimmedString isEqualToString:@"r\n"]) ||
               ([trimmedString isEqualToString:@"roll\n"]))
            {
                NSLog(@"you typed %@", userInput);
                [playerManager roll];
                
                if([[playerManager currentPlayer] currentSquare] >= 100){
                    [[playerManager currentPlayer] setGameOver:YES];
                    NSLog(@"game is over");
                    
                    // release all players
                    [[playerManager players] removeAllObjects];
                }
            }
            
        }
        
        
        
    }
    return 0;
}

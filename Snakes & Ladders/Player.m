//
//  Player.m
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _currentSquare = 0;
        
        _specialSquares = @{@(4):@(14),
                            @(9):@(31),
                            @(17):@(7),
                            @(20):@(38),
                            @(28):@(84),
                            @(40):@(59),
                            @(51):@(67),
                            @(63):@(81),
                            @(64):@(60),
                            @(89):@(26),
                            @(95):@(75),
                            @(99):@(78)
                            };
    }
    return self;
}

- (void)roll{
    
    int dieValue = arc4random_uniform(6) + 1;
    NSLog(@"rolled %d", dieValue);

    long currentSquare = self.currentSquare;
    long newSquare = currentSquare + (long)dieValue;
    
    if([_specialSquares objectForKey:@(newSquare)] != nil){
        // the new square is a snake or ladder...
        NSLog(@"special square %ld", newSquare);
        long brandNewSquare = [[_specialSquares objectForKey:@(newSquare)] longValue];
        self.currentSquare = brandNewSquare;
        NSLog(@"old square was %ld and new is %ld", currentSquare, brandNewSquare);

    }else{
        self.currentSquare = newSquare;
        NSLog(@"old square was %ld and new is %ld", currentSquare, newSquare);

    }
  
    
    
}

@end

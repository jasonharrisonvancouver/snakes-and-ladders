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
        self.currentSquare = 0;
    }
    return self;
}

- (void)roll{
    
    int dieValue = arc4random_uniform(6) + 1;
    NSLog(@"rolled %d", dieValue);

    long currentSquare = self.currentSquare;
    long newSquare = currentSquare + (long)dieValue;
    
    self.currentSquare = newSquare;
    NSLog(@"old square was %ld and new is %ld", currentSquare, newSquare);
    
}

@end

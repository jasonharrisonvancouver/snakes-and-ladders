//
//  Player.m
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void)roll{
    
    int dieValue = arc4random_uniform(6) + 1;
    
    NSLog(@"%d", dieValue);
}

@end

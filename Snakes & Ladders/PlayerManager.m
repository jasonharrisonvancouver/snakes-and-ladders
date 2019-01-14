//
//  PlayerManager.m
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _players = [[NSMutableArray<Player *> alloc] init];
    }
    return self;
}

@end

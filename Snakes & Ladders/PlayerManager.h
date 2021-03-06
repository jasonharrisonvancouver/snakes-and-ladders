//
//  PlayerManager.h
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerManager : NSObject

@property (nonatomic, readwrite, strong)NSMutableArray<Player *> *players;
@property (nonatomic, readwrite, strong)Player *currentPlayer;
@property (nonatomic, readwrite)NSInteger indexOfCurrentPlayer;

- (void)roll;
- (void)createPlayer:(NSString *)name;
- (NSString *)score;
@end

NS_ASSUME_NONNULL_END

//
//  Player.h
//  Snakes & Ladders
//
//  Created by jason harrison on 2019-01-13.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property NSInteger currentSquare;

- (void)roll;

@end

NS_ASSUME_NONNULL_END

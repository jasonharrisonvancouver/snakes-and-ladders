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
        _currentPlayer = [[Player alloc] init];
        _indexOfCurrentPlayer = 0;//(int)@(0);
       // NSLog(@"index be %d", (int)_indexOfCurrentPlayer);

    }
    return self;
}

- (void)roll{
    //_currentPlayer = self.currentPlayer;
    //NSLog(@"(1)manager is telling player %@ to roll...", [_currentPlayer name]);
    //NSLog(@"index be %d", (int)_indexOfCurrentPlayer);
    //_currentPlayer = [_players objectAtIndex:_indexOfCurrentPlayer];
    _currentPlayer = [self currentPlayer];
    [_currentPlayer roll];
    //NSLog(@"(2)manager is telling player %@ to roll...", [_currentPlayer name]);
   // NSLog(@"%@ rolled a %d", [_currentPlayer name], );
   // [[self.players objectAtIndex:self.indexOfCurrentPlayer] roll];
    //[self.currentPlayer roll];
    _indexOfCurrentPlayer++;
}

- (void)createPlayer:(NSString *)name{
    Player *player = [[Player alloc] init];
    [player setName:name];
    [_players addObject:player];
    int numPlayers = (int)[_players count];
    int thisPlayerIndex = numPlayers - 1;
    //NSLog(@"added player %@ to index %d", name, thisPlayerIndex);
}

- (Player *)currentPlayer{
    int numberOfPlayers = (int)[_players count];
    int actualIndex = _indexOfCurrentPlayer % numberOfPlayers;
    //NSLog(@"current player index is %d and name is %@", actualIndex, [_players[actualIndex] name]);
    return [_players objectAtIndex:actualIndex];
}

- (NSString *)score{
    NSMutableString *scoreString = [[NSMutableString alloc] init];
    
    [scoreString appendString:@"Score: "];
    
    for (Player *player in _players) {
        [scoreString appendString:[player score]];
        [scoreString appendString:@", "];
    }

    [scoreString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    scoreString = (NSMutableString *)[scoreString substringToIndex:[scoreString length]-1];

    return scoreString;
}
@end

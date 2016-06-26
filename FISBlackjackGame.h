//
//  FISBlackjackGame.h
//  
//
//  Created by Erica on 6/17/16.
//
//


#import <Foundation/Foundation.h>
#import "FISCardDeck.h"
#import "FISBlackjackPlayer.h"

@interface FISBlackjackGame : NSObject

@property (strong, nonatomic) FISCardDeck *deck;
@property (strong, nonatomic) FISBlackjackPlayer *house;
@property (strong, nonatomic) FISBlackjackPlayer *player;

- (void)playBlackjack;
- (void)dealNewRound;
- (void)dealCardToPlayer;
- (void)dealCardToHouse;
- (void)processPlayerTurn;
- (void)processHouseTurn;
- (BOOL)houseWins;
- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins;

@end
//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Erica on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"
//
//@interface FISCardDeck ()

//-(void)allCardsDeck;{
//    
//}
//
//
//@end
//
//




@implementation FISCardDeck



-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _remainingCards = [NSMutableArray new];
        _dealtCards = [NSMutableArray new];
        
        [self generateDeck];
    }
    
    return self;
}

-(FISCard *)drawNextCard{
    
    if([self.remainingCards count] == 0) {
        return nil;
        NSLog(@"The Deck is Empty");
    }
    
    FISCard *pickedCard = self.remainingCards[0];
    [self.dealtCards addObject: self.remainingCards[0]];
    [self.remainingCards removeObjectAtIndex:0];
    
    return pickedCard;
}

-(void)resetDeck {
    
    [self gatherDealtCards];
    [self shuffleRemainingCards];
    
}

-(void)gatherDealtCards {
    
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
    
    
}

-(void)shuffleRemainingCards {
    
    NSMutableArray *mArray = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    while([mArray count] != 0) {
        NSUInteger randomIndex = arc4random_uniform((int)[mArray count]);
        [self.remainingCards addObject:mArray[randomIndex]];
        [mArray removeObjectAtIndex:randomIndex];
        
    }
    
    
    
}

-(void)generateDeck {
    
    
    
    for (NSString *suit in [FISCard validSuits]) {
        for (NSString *rank in [FISCard validRanks]) {
            
            FISCard *newCard = [[FISCard alloc] initWithSuit:suit rank:rank];
            
            [self.remainingCards addObject:newCard];
        }
    }
    
    
}


- (NSString *)description {
    NSString *descriptionOfString = [NSString stringWithFormat:@"count:%lu \n cards:%@", [self.remainingCards count], self.remainingCards];
    return descriptionOfString;
    
}





@end

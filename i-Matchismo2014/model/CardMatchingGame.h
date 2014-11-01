//
//  CardMatchingGame.h
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/3/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"

@interface CardMatchingGame : NSObject

/**
 cardsInGame
 */
@property (nonatomic, strong) NSMutableArray * cards;
/**
 Score could be negative
 */
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic,getter = isThreeCardsGame) BOOL threeCardsGame;
/**
 Designated initializer
 */
-(instancetype) initWithCardCount:(NSUInteger)count
                             deck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
-(void)determineMatch:(NSMutableArray *)cardsChoosen
          cardsInGame:(BOOL)isThreeCardGame;
@end

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
 Score could be negative
 */
@property (nonatomic, readonly) NSInteger score;

/**
 Designated initializer
 */
-(instancetype) initWithCardCount:(NSUInteger)count
                             deck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@end

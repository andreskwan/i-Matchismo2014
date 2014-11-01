//
//  PlayingCardDeck.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/2/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
-(instancetype)init
{
    self = [super init];
    if (self) {
        //PlayingCardDeck * deck = [[PlayingCardDeck alloc]init];
        //this is self
        for (NSString * suit in [PlayingCard validSuits]){
            for (int rank = 1 ; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                card.color = [UIColor blackColor];
                [self addCard:card];
            }
        }
    }
    return self;
}

@end

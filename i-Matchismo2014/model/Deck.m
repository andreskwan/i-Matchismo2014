//
//  Deck.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/2/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "Deck.h"


@interface Deck()
/**
 Private: To store the cards of the deck
 no type associated to the array, could store anything
 */
//@property (strong, nonatomic) NSMutableArray * cards;
@end

@implementation Deck
- (NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        //an example of sending messages to nil
        //nothing happen if cards is not instantiated!!!
        //0 is the top FIFO
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card *) drawRandomCard{
    Card *randomCard = nil;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        //what if the deck is empty
        //Program crash, you get array index out of bounds
        [self.cards removeObjectAtIndex:index];
    }
    //nil if not cards in the deck
    return randomCard;
}

@end

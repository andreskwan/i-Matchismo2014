//
//  Deck.h
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/2/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
/**
 Deck is a generic deck of cards, not game associated,
 just a list of cards. could be a deck of flash cards (foreign words
 that I’m trying to learn)
 what we need
 - to add cards to the deck.
 - remove cards from the deck.
 - store in someway those cards - Array, Plist, CoreData,
 */

@interface Deck : NSObject
@property (strong, nonatomic) NSMutableArray * cards;

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end

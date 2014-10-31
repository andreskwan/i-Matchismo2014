//
//  CardMatchingGame.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/3/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "CardMatchingGame.h"

static const int  MISTATCH_PENALTY = 2;
static const int  MATCH_BONUS      = 4;
static const int  COST_TO_CHOOSE   = 1;

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
/**
 cardsInGame
 */
@property (nonatomic, strong) NSMutableArray * cards; //of cards
@end

@implementation CardMatchingGame


/**
 designated initializer
 - needs that the init exist in the class
 you have to call this initializer or this class won’t do anything.
 
 if inheritance then call it using
 self = [ super initwithCardCount:count usingDeck:deck];
 
 */
-(instancetype) initWithCardCount:(NSUInteger)count
                             deck:(Deck *)deck
{
    self = [super init];
    if(self)
    {
        //extract “count” numbers of cards in game from “deck”
        //validate consistency of the value of the params
        //I call this, validate consistency of the parameters to each other.
        if(count < [deck.cards count])
        {
            for(int i =0; i<count; i++)
            {
                //add this cards to “cards” in game
                self.cards[i] = [deck drawRandomCard];
            }
        }else{
            return nil;
        }
    }
    return self;
}
-(NSMutableArray *)cards
{
    return (!_cards) ? _cards =
    [[NSMutableArray alloc]init] : _cards;
}
-(Card *)cardAtIndex:(NSUInteger)index
{
    // validate consistency of the parameters to each other.
    //what about if index is greater than [self.cards count]
    return (index < [self.cards count]) ? self.cards[index] : nil;
}
//v3 35min
-(void)chooseCardAtIndex:(NSUInteger)index
{
    //what card the user pick up
    Card * cardSelected = [self cardAtIndex:index];
    //identify if it match against the other card(two card matching game)
    if(!cardSelected.isMatched){
        if(cardSelected.isChosen){
            //just match against chosen cards
            //flip the card unchosen if chosen twice
            cardSelected.chosen = NO;
        }else{  //match a new card chosen(not set yet) against the another chosen & not matched card
            
            //identify if it match against the other card(two card matching game)
            //compare each card?
            for(Card * otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    //this way allows me to compare against the array of cards selected
                    //should be a different if more than two card comparison
                    //Zero if not match at all
                    int matchScore = [otherCard match:@[cardSelected]];
                    if(matchScore)
                    {
                        //if match then set a score
                        self.score += matchScore + MATCH_BONUS;
                        //mark cards as matched
                        otherCard.matched = YES;
                        cardSelected.matched = YES;
                    }else{
                        //if not match set a penalty
                        self.score -= MISTATCH_PENALTY;
                        //flip it over or release this selection.
                        otherCard.chosen = NO;
                    }
                    //found the match, no more iteration if just two card matching game
                    break;
                }
            }
            //if you flip the card, you have to pay for that
            self.score -= COST_TO_CHOOSE;
            //mark card as chosen
            cardSelected.chosen = YES;
        }
    }
}
@end

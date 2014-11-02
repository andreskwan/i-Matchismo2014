//
//  CardMatchingGame.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/3/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "CardMatchingGame.h"

static const int  DEFAULT_GAME_SIZE   = 2;
static const int  MISTATCH_PENALTY = 2;
static const int  MATCH_BONUS      = 4;
static const int  COST_TO_CHOOSE   = 2;

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;

///**
// cardsInGame
// */
//@property (nonatomic, strong) NSMutableArray * cards;
//of cards
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
        //default is a card game of size 2
        _cardGameSize = DEFAULT_GAME_SIZE;
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
    Card * cardSelected = [self cardAtIndex:index];
    NSMutableArray * cardsChoosen = [[NSMutableArray alloc]init];
    [cardsChoosen insertObject:cardSelected atIndex:0];
    
    if(!cardSelected.isMatched){
        if(cardSelected.isChosen){
            //just match against chosen cards
            //flip the card unchosen if chosen twice
            cardSelected.chosen = NO;
        }else{  //match a new card chosen(not set yet) against the another chosen & not matched card
            //mark card as chosen
            cardSelected.chosen = YES;
            //if you flip the card, you have to pay for that
            //pay just for select
            self.score -= COST_TO_CHOOSE;
            //set an array of all cards that are
            //chosen and not matched
            //last card is the selected one
            for(Card * otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    //add card at index 0
                    [cardsChoosen insertObject:otherCard atIndex:0];
                }
            }
            //[self determineMatch:cardsChoosen
            //         cardsInGame:self.isThreeCardsGame];
            [self determineMatch:cardsChoosen gameSize:4];
        }
    }
}
- (void)determineMatch:(NSMutableArray *)cardsChoosen
              gameSize:(NSInteger)cardGameSize
{
    Card * cardSelected = [cardsChoosen lastObject];
    [cardsChoosen removeObject:cardSelected];
    int matchScore = 0;
    matchScore = [cardSelected match:cardsChoosen];
    if(matchScore)
    {
        if ([cardsChoosen count] == (cardGameSize -1))
        {
            //if match then set a score
            self.score += matchScore + (MATCH_BONUS * (cardGameSize - 1));
            //mark cards as matched
            cardSelected.matched = YES;
            for (Card *card in cardsChoosen) {
                card.matched = YES;
            }
        }
    }else{//relese cards in array & penalty
            //if not match set a penalty
            self.score -= MISTATCH_PENALTY;
            //flip it over or release this selection.
            //            cardSelected.chosen = NO;
            for (Card *card in cardsChoosen) {
                card.chosen = NO;
            };
        }
    }
@end




//
//  PlayingCard.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/2/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()


@end

/**
 This is the specific card for the matching game
 */
@implementation PlayingCard

//designated initializer
- (instancetype) initWithRank:(NSUInteger)rank
                         suit:(NSString *)suit
                        color:(UIColor *)color
{
    self = [super init];
    if (self) {
        _rank = rank;
        _suit = suit;
        _color = color;
    }
    return self;
}
/**
 Function description: test if this playingCard match with
 one another card selected by rank or suit, never both
 
 @param array of playingCards that holds just one card
 @returns int value for score 4 if equal rank, 1 if equal suit, not other cases.
 */

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard * otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if ( [otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}
- (NSString *) contents
{
    NSArray * rankStrings = [PlayingCard validRanks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize rank = _rank;

+ (NSArray *) validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank
{
    return [[PlayingCard validRanks] count] -1;
}

- (void)setRank:(NSUInteger)rank
{
    //self.rank or _rank none!!! is the param!!!
    if(rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

- (NSUInteger) rank
{
    /**
     if not initialized could be any value
     */
    return _rank? _rank : 0;
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit? _suit : @"?";
}

@end

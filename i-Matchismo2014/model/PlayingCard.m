//
//  PlayingCard.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/2/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "PlayingCard.h"

/**
 This is the specific card for the matching game
 */
@implementation PlayingCard

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

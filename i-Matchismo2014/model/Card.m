//
//  Card.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/1/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "Card.h"

@implementation Card


/**
    Compare each card of otherCards array whit this instance of card,
    to identify how well their contents attribute match according to
    the rules of the game
    @param card to be matched against
    @returns 0 if cards don't match or + 1 for each card matched
 */
-(int)match:(NSArray *)otherCards
{
    int score= 0;
    for(Card * otherCard in otherCards){
        if([self.contents isEqualToString:otherCard.contents]){
            score++;
        }
    }
    return score;
}

@end

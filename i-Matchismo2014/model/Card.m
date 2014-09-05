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
    Compare each card "contents" value in the otherCards array whit this instance of card "contents" value,
    @param Array of cards to be matched against the instace of self card
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

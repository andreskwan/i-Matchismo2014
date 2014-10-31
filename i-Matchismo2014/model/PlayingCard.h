//
//  PlayingCard.h
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/2/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "Card.h"


@interface PlayingCard : Card

- (instancetype) initWithRank:(NSUInteger)rank
                         suit:(NSString *)suit
                        color:(UIColor *)color;


@property (nonatomic, strong)UIColor * color;
/**
 unicode chars for card's suits
 */
@property (strong,nonatomic) NSString * suit;
/**
 number between 0 and 13
 */
@property (nonatomic) NSUInteger rank;
+ (NSArray *) validRanks;

/**
 Let people know what are the valid values of suits
*/
+ (NSArray *) validSuits;

/**
 let the API user know how many
 */
+ (NSUInteger) maxRank;
@end

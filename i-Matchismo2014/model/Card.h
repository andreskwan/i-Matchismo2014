//
//  Card.h
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/1/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic)NSString * contents;
/**
 Card has been chosen or selected
 */
@property (nonatomic, getter = isChosen) BOOL chosen;
/**
 Card has been matched with another card
 */
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end

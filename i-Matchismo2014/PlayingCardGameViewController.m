//
//  PlayingCardGameViewController.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 10/26/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

@end

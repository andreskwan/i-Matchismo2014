//
//  PlayingCardDeckTest.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 10/31/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import <Foundation/Foundation.h>

@interface PlayingCardDeckTest : XCTestCase
@property (nonatomic, strong)PlayingCardDeck * playingCD;
//@property (nonatomic, strong)NSArray        * validRanks;
//@property (nonatomic, strong)NSArray        * validSuits;
//@property (nonatomic, strong)NSUInteger      maxRank;
@property (nonatomic, strong)NSMutableArray  * playingCards;

@end

@implementation PlayingCardDeckTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    self.validRanks = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
//    self.validSuits = @[@"♥",@"♦",@"♠",@"♣"];
//    self.maxRank    = [self.validSuits count] - 1;
    self.playingCD = [[PlayingCardDeck alloc]init];
    self.playingCards = [[NSMutableArray alloc]init];
    
    //create an independet array of Playing cards to compare
    //this is based in the previous test done to PlayingCard class
    for (NSString * suit in [PlayingCard validSuits]){
        for (int rank = 1 ; rank <= [PlayingCard maxRank]; rank++) {
            PlayingCard *card = [[PlayingCard alloc]init];
            card.suit = suit;
            card.rank = rank;
            card.color = [UIColor blackColor];
            [self.playingCards addObject:card];
        }
    }

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.playingCD = nil;
    self.playingCards = nil;
}

//todas diferentes
//must be 52 cards
- (void)testInit
{
////        NSLog(@"%@",@"--------------------------------------------");
//    NSSet * set1 = [NSSet setWithArray:self.playingCD.cards];
//    NSSet * set2 = [NSSet setWithArray:self.playingCards];
////    NSSet * playingCDSet = [NSSet setWithArray:self.playingCD.cards];
//    NSLog(@"self.playingCards    :%@",[self.playingCards description]);
//    NSLog(@"self.playingCD.cards :%@",[self.playingCD.cards description]);
////    XCTAssertTrue([set1 isEqualToSet:set2], @"Arrays Cards must be equal");
//    if ([set1 isEqualToSet:set2]) {
//        NSLog(@"%@",@"--------------------------------------------");
//        NSLog(@"%@",@"are equal");
//    }else{
//        NSLog(@"%@",@"--------------------------------------------");
//        NSLog(@"%@",@"are no equal");
//    }
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

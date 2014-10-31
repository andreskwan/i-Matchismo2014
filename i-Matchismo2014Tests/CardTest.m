//
//  CardTest.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 10/31/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Card.h"
#import "PlayingCard.h"

@interface CardTest : XCTestCase
@property (nonatomic,strong)Card *card;
@property (nonatomic,strong)Card *card1;
@property (nonatomic,strong)Card *card2;
@property (nonatomic,strong)NSArray *otherCards;
@end

@implementation CardTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.card = [[Card alloc]init];
    self.card.contents = @"Card of love";
    self.card.chosen   = YES;
    self.card1 = [[Card alloc]init];
    self.card1.contents = @"Card of love";
    self.card1.chosen   = YES;
    self.card2 = [[Card alloc]init];
    self.card2.contents = @"Card of goals";
    self.card2.chosen   = YES;
    self.otherCards = @[self.card1,self.card2];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.card  = nil;
    self.card1 = nil;
    self.card2 = nil;
    self.otherCards = nil;
}

- (void)testCardType
{
    XCTAssertEqualObjects([self.card class], [Card class], @"Class should be Card");
}

/**
 Function description: test if the card.contents is equal to any other card.contents in the othersCards array, in this case one card has the same contents
 
 @param none
 @returns none
 */

- (void)testMatchCardsEqual
{
    XCTAssertEqual([self.card match:self.otherCards],1,@"Score should be 1");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

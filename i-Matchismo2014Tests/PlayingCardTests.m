//
//  PlayingCardTests.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 10/30/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlayingCard.h"

@interface PlayingCardTests : XCTestCase
@property (nonatomic) PlayingCard * playingCard;
@property (nonatomic) PlayingCard * playingCard1;
@property (nonatomic) PlayingCard * playingCard2;
@property (nonatomic) NSArray     * otherCards;
@property (nonatomic) NSArray     * otherCards1;
@property (nonatomic) NSArray     * validRanks;
@property (nonatomic) NSArray     * validSuits;
@end

@implementation PlayingCardTests

- (void)setUp {
    [super setUp];
    // Put setup code here.
    // This method is called before the invocation of each test method in the class.
    self.playingCard = [[PlayingCard alloc]initWithRank:1
                                                   suit:@"♣"
                                                  color:[UIColor blackColor]];
    self.playingCard1 = [[PlayingCard alloc]initWithRank:1
                                                   suit:@"♣"
                                                  color:[UIColor blackColor]];
    self.playingCard2 = [[PlayingCard alloc]initWithRank:11
                                                   suit:@"♣"
                                                  color:[UIColor blackColor]];
    self.otherCards  = @[self.playingCard1];
    self.otherCards1 = @[self.playingCard2];
    self.validRanks  = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    self.validSuits  = @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)tearDown {
    // Put teardown code here.
    // This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.playingCard   = nil;
    self.playingCard1  = nil;
    self.playingCard2  = nil;
    self.otherCards    = nil;
    self.otherCards1   = nil;
    self.validRanks    = nil;
    self.validSuits    = nil;
}


/**
 Function description: Test if instacetype is turned into PlayingCard type
 
 @param node
 @returns node
 */

- (void)testPlayingCardExits
{
    XCTAssertNotNil(self.playingCard, @"The playing card should exist.");
}

- (void)testPlayinCardType
{
    XCTAssertEqualObjects([self.playingCard class], [PlayingCard class],@"Class should be PlayingCard");
}
/**
 Function description: Test designated initializer
 
 @param none
 @returns none
 */

- (void)testCardIsAceOfClubs
{
    XCTAssertEqualObjects([PlayingCard validRanks][self.playingCard.rank], @"A", @"rank should be A");
    XCTAssertEqualObjects(self.playingCard.suit, @"♣", @"suit should be ♣:");
    XCTAssertEqualObjects(self.playingCard.color, [UIColor blackColor], @"color should be black");
}

- (void)testMatchRank
{
    XCTAssertEqual([self.playingCard match:self.otherCards], 4, @"Ranks should be equal");
}

- (void)testMatchSuit
{
    XCTAssertEqual([self.playingCard match:self.otherCards1], 1, @"Suits should be equal");
}
- (void)testValidRanks
{
    XCTAssertTrue([[PlayingCard validRanks] isEqualToArray:self.validRanks], @"Valid Ranks should be equal");
}
- (void)testMaxRankOfPlayingCard
{
    XCTAssertEqual([PlayingCard maxRank],13,@"Max rank of a playing card should be 13 or K");
}
- (void)testValidSuits
{
    XCTAssertTrue([[PlayingCard validSuits] isEqualToArray:self.validSuits], @"Valid Ranks should be equal");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

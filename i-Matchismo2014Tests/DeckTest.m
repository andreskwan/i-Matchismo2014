//
//  DeckTest.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 10/31/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Deck.h"
#import "Card.h"

@interface DeckTest : XCTestCase
@property (nonatomic, strong) Deck           * deck;
@property (nonatomic, strong) Card           * card;
@property (nonatomic, strong) Card           * card1;

@end

@implementation DeckTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.deck  = [[Deck alloc]init];
    self.card  = [[Card alloc]init];
    self.card.contents = @"card contents";
    self.card1 = [[Card alloc]init];
    self.card1.contents = @"card1 contents";

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.deck = nil;
    self.card = nil;
    self.card1 = nil;
}

- (void)testCardsLazyInstantiation
{
    NSLog(@"%@",@"--------------------------------------------");
    NSLog(@"%@",[self.deck.cards description]);
    XCTAssertNotNil(self.deck.cards, @"Deck of Cards should exist");
}
- (void)testCardsLazyInstantiationCorrectType
{
    NSLog(@"%@",@"--------------------------------------------");
    NSLog(@"%@",[[self.deck.cards class] description]);
    XCTAssertEqualObjects([self.deck.cards class], [[NSMutableArray new]class], @"Array of cards should be NSMutableArray");
}
- (void)testAddCard
{
    NSLog(@"%@",@"--------------------------------------------");
    [self.deck addCard:self.card];
    XCTAssertTrue([self.deck.cards containsObject:self.card]);
}

- (void)testAddCardAtTop
{
    NSLog(@"%@",@"--------------------------------------------");
    [self.deck addCard:self.card  atTop:YES];
    [self.deck addCard:self.card1 atTop:YES];
    XCTAssertEqualObjects([self.deck.cards firstObject],
                          self.card1,
                          @"Card should be at top of the array");
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

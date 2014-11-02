//
//  CardMatchingGameTest.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 10/31/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CardMatchingGame.h"
#import "PlayingCard.h"

@interface CardMatchingGameTest : XCTestCase
@property (nonatomic, strong)CardMatchingGame * cardMG;
@property (nonatomic)NSUInteger                 count;
@property (nonatomic, strong)PlayingCardDeck  * deck;
@property (nonatomic, strong)NSMutableArray   * cardsChoosen;
@property (nonatomic, strong)NSArray          * validSuits;

//@property (nonatomic, strong)PlayingCard      * card1;
//@property (nonatomic, strong)PlayingCard      * card2;
//@property (nonatomic, strong)PlayingCard      * card3;
//@property (nonatomic, strong)PlayingCard      * card4;

@end

@implementation CardMatchingGameTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.count  = 8;
    self.deck   = [[PlayingCardDeck alloc]init];
    self.cardMG   = [[CardMatchingGame alloc]
                   initWithCardCount:self.count
                                deck:self.deck];
    self.cardsChoosen = [[NSMutableArray alloc]init];
    self.validSuits   = @[@"♥",@"♦",@"♠",@"♣"];
}
- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.cardMG = nil;
    self.count = 0;
    self.deck  = nil;
    self.cardsChoosen = nil;
    self.validSuits = nil;
}
- (void)testInitWithCardCountDeck
{
    XCTAssertNotNil(self.cardMG, @"Should not be nil");
    XCTAssertEqual([self.cardMG.cards count], self.count, @"Deck size of playing cars is wrong" );
}
//lazy instantiation
- (void)testCardsLazyInstantiation
{
    NSLog(@"%@",@"--------------------------------------------");
    NSLog(@"%@",[self.cardMG.cards description]);
    XCTAssertNotNil(self.cardMG.cards, @"Deck of Cards should exist");
}
- (void)testCardsLazyInstantiationCorrectType
{
    NSLog(@"%@",@"--------------------------------------------");
    NSLog(@"%@",[[self.cardMG.cards class] description]);
    XCTAssertEqualObjects([self.cardMG.cards class], [[NSMutableArray new]class], @"Array of cards should be NSMutableArray");
}
- (void)testPerformanceExample
{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)testLazyInstantiationTwoCardsGame
{
    NSLog(@"%@",@"--------------------------------------------");
//    XCTAssertTrue(self.isTwoCardsGame, @"Default value should be True");
}
//two cards
- (void)testDetermineMatchCardsInTwoCardsGameNoMatch
{
    //A heart
    PlayingCard * card1  = [[PlayingCard alloc]initWithRank:1
                                              suit:self.validSuits[0]
                                             color:[UIColor blackColor]];
    //A diamonds
    PlayingCard * card2  = [[PlayingCard alloc]initWithRank:1
                                              suit:self.validSuits[1]
                                             color:[UIColor blackColor]];
    //A spades
    PlayingCard * card3  = [[PlayingCard alloc]initWithRank:1
                                              suit:self.validSuits[2]
                                             color:[UIColor blackColor]];
    //K clubs
    PlayingCard * card4  = [[PlayingCard alloc]initWithRank:13
                                              suit:self.validSuits[3]
                                             color:[UIColor blackColor]];
    card1.chosen = YES;
    card2.chosen = NO;
    card3.chosen = NO;
    //this is the cardAtIndex
    card4.chosen = YES;
    
    
    [self.cardsChoosen addObjectsFromArray:@[card1, card4]];
    //after run this method
    //the cards in the array must change
    [self.cardMG determineMatch:self.cardsChoosen
                    gameSize:self.cardMG.cardGameSize];
    //card1 no longer chosen
    XCTAssertFalse(card1.chosen, @"This should be false or NO");
    //card4 is chosen, ready to match to another one
    XCTAssertTrue(card4.chosen, @"This should be false or NO");
    
    XCTAssertFalse(card1.matched, @"This should be false or NO");
    XCTAssertFalse(card4.matched, @"This should be false or NO");
    
    //pay the cost of choose a card
    XCTAssertEqual(self.cardMG.score, -2, @"The score should be 0");
    
}
- (void)testDetermineMatchCardsInTwoCardsGameMatchRank
{
    //A heart
    PlayingCard * card1  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[0]
                                                      color:[UIColor blackColor]];
    //A diamonds
    PlayingCard * card2  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[1]
                                                      color:[UIColor blackColor]];
    //A spades
    PlayingCard * card3  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[2]
                                                      color:[UIColor blackColor]];
    //K clubs
    PlayingCard * card4  = [[PlayingCard alloc]initWithRank:13
                                                       suit:self.validSuits[3]
                                                      color:[UIColor blackColor]];
    card1.chosen = YES;
    //this is the cardAtIndex
    card2.chosen = YES;
    card3.chosen = NO;
    card4.chosen = NO;
    
    
    [self.cardsChoosen addObjectsFromArray:@[card1, card2]];
    //after run this method
    //the cards in the array must change
    [self.cardMG determineMatch:self.cardsChoosen
                    gameSize:self.cardMG.cardGameSize];

    XCTAssertTrue(card1.chosen, @"This should be true");
    XCTAssertTrue(card2.chosen, @"This should be true");
    
    XCTAssertTrue(card1.matched, @"This should be true");
    XCTAssertTrue(card2.matched, @"This should be true");

    
    //pay the cost of choose a card
    //23 for match + 4 for bonus
    XCTAssertEqual(self.cardMG.score, 27, @"The score should be 0");
    
}
- (void)testDetermineMatchCardsInTwoCardsGameMatchSuit
{
    //A hearts
    PlayingCard * card1  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[0]
                                                      color:[UIColor blackColor]];
    //A diamonds
    PlayingCard * card2  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[1]
                                                      color:[UIColor blackColor]];
    //A spades
    PlayingCard * card3  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[2]
                                                      color:[UIColor blackColor]];
    //K hearts
    PlayingCard * card4  = [[PlayingCard alloc]initWithRank:13
                                                       suit:self.validSuits[0]
                                                      color:[UIColor blackColor]];
    card1.chosen = YES;
    //this is the cardAtIndex
    card2.chosen = NO;
    card3.chosen = NO;
    card4.chosen = YES;
    
    
    [self.cardsChoosen addObjectsFromArray:@[card1, card4]];
    //after run this method
    //the cards in the array must change
    [self.cardMG determineMatch:self.cardsChoosen
                    gameSize:3];
    
    XCTAssertTrue(card1.chosen, @"This should be true");
    XCTAssertTrue(card4.chosen, @"This should be true");
    
    XCTAssertTrue(card1.matched, @"This should be true");
    XCTAssertTrue(card4.matched, @"This should be true");
    
    
    //pay the cost of choose a card
    //2 for match + 4 for bonus
    XCTAssertEqual(self.cardMG.score, 6, @"The score should be 0");
    
}
//three cards or more
- (void)testDetermineMatchCardsInThreeCardsGameNoMatch
{
    //A heart
    PlayingCard * card1  = [[PlayingCard alloc]initWithRank:1
                                                       suit:self.validSuits[0]
                                                      color:[UIColor blackColor]];
    //A diamonds
    PlayingCard * card2  = [[PlayingCard alloc]initWithRank:2
                                                       suit:self.validSuits[1]
                                                      color:[UIColor blackColor]];
    //A spades
    PlayingCard * card3  = [[PlayingCard alloc]initWithRank:3
                                                       suit:self.validSuits[2]
                                                      color:[UIColor blackColor]];
    //K clubs
    PlayingCard * card4  = [[PlayingCard alloc]initWithRank:13
                                                       suit:self.validSuits[3]
                                                      color:[UIColor blackColor]];
    card1.chosen = YES;
    card2.chosen = YES;
    card3.chosen = NO;
    //this is the cardAtIndex
    card4.chosen = YES;
    
    self.cardMG.threeCardsGame = YES;
    
    [self.cardsChoosen addObjectsFromArray:@[card1, card2, card4]];

    [self.cardMG determineMatch:self.cardsChoosen
                    gameSize:self.cardMG.cardGameSize];
    
    //card1 no longer chosen
    XCTAssertFalse(card1.chosen, @"This should be false or NO");
    XCTAssertFalse(card2.chosen, @"This should be false or NO");
    //card4 is chosen, ready to match to another one
    XCTAssertTrue(card4.chosen, @"This should be True");
    
    XCTAssertFalse(card1.matched, @"This should be false");
    XCTAssertFalse(card2.matched, @"This should be false");
    XCTAssertFalse(card4.matched, @"This should be false");
    
    //pay the cost of choose a card
    XCTAssertEqual(self.cardMG.score, -2, @"The score should be 0");
}

@end

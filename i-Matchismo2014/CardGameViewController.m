//
//  CardGameViewController.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/1/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSelector;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController
-(CardMatchingGame *)game
{
    if(!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                       deck:[self createDeck]];
    }
    return _game;
}
/**
 Function description: Abstract method
*/
-(Deck *)createDeck
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    /**
     with sender and IBOutletCollection I could obtain the 
     card.
     obtain the index of the button in the array of buttons
     */
    [self.game chooseCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton * cardButton in self.cardButtons) {
        //we need the index of the cardButton
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        //obtain the PlayingCard related with the cardButton
        Card * card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %d", self.game.score];
}

-(NSString *)titleForCard:(Card *)card
{
    return (card.isChosen)? card.contents : @"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:(card.isChosen? @"cardfront" : @"cardback" )];
}
- (IBAction)newGameButton {
    self.game = nil;

    [self setGameMode:self.gameModeSelector];
    [self game];
    [self updateUI];
    self.gameModeSelector.enabled = YES;
        [self areCardsEnable:NO];
}
- (IBAction)setGameMode:(id)sender
{
    NSUInteger mode = [sender selectedSegmentIndex];
    self.game.cardGameSize = (mode == 0)?2:3;
    self.gameModeSelector.enabled = NO;
    [self areCardsEnable:YES];
}

- (void)viewDidLoad
{
    [self areCardsEnable:NO];
}

- (void)areCardsEnable:(BOOL)enable
{
    for (UIButton * cardButton in self.cardButtons) {
        cardButton.enabled = enable;
    }
}

@end

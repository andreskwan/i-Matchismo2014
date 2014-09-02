//
//  CardGameViewController.m
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/1/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck * deck;

@end

@implementation CardGameViewController

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc]init];
    }
    return _deck;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text =
    [NSString stringWithFormat:@"Flips: %d Deck: %d", self.flipCount, [self.deck.cards count ]];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([self.deck.cards count])
    {
        if ([sender.currentTitle length])
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
        }else{
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
            
        }
        self.flipCount++;
    }
}


@end

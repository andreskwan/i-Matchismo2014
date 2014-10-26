//
//  CardGameViewController.h
//  i-Matchismo2014
//
//  Created by Andres Kwan on 9/1/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController
/**
 Protected
 for subclasses
 */
-(Deck *)createDeck; //abstract
@end

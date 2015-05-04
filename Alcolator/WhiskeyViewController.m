//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Joe Lucero on 5/4/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

float numberOfWhiskeyGlassesForEquivalentAcloholAmount = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set Title:
    self.navigationItem.title = @"Whiskey";
}

- (IBAction)buttonPressed:(id)sender {
    [self.beerPercentTextField resignFirstResponder];
    //first, calculate how much alcohol is in all those beers...
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // same for wine...
    float ouncesInOneWhiskeyGlass = 1;
    float alcoholPercentageOfWhiskey = 0.4;
    float ouncesOfAlocoholPerWihiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    numberOfWhiskeyGlassesForEquivalentAcloholAmount = ouncesOfAlcoholTotal / ouncesOfAlocoholPerWihiskeyGlass;
    //decide whether to use beer/beers and glass/glasses
    NSString * beerText;
    if (numberOfBeers ==1){
        beerText = NSLocalizedString(@"beer", @"singular beer");
    }
    else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    if (numberOfWhiskeyGlassesForEquivalentAcloholAmount ==1){
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    }
    else{
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    //generate the result text, and display it on the label
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.lf %@ of whiskey.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAcloholAmount, whiskeyText];
    self.resultLabel.text = resultText;
    self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%.lf %@)", nil), numberOfWhiskeyGlassesForEquivalentAcloholAmount, whiskeyText];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%.lf", (float) numberOfWhiskeyGlassesForEquivalentAcloholAmount]];
}


@end

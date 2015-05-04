//
//  ViewController.m
//  Alcolator
//
//  Created by Joe Lucero on 5/3/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *numberofBeersLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0){
        // The user typed 0, or something that's not a number so clear the field
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    int numberOfBeers = sender.value;
//    This works fine, why won't the textLabel accept numberOfBeers in this statement?
//    NSLog(@"%i", numberOfBeers);
    self.numberofBeersLabel.text = [NSString stringWithFormat: @"Number of beers: %i", numberOfBeers];
    [self.beerPercentTextField resignFirstResponder];
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
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = 0.13;
    float ouncesOfAlocoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAcloholAmount = ouncesOfAlcoholTotal / ouncesOfAlocoholPerWineGlass;
    //decide whether to use beer/beers and glass/glasses
    NSString * beerText;
    if (numberOfBeers ==1){
        beerText = NSLocalizedString(@"beer", @"singular beer");
    }
    else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAcloholAmount ==1){
        wineText = NSLocalizedString(@"glass", @"singular glass");
    }
    else{
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    //generate the result text, and display it on the label
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.lf %@ of wine.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAcloholAmount, wineText];
    self.resultLabel.text = resultText;
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}


@end

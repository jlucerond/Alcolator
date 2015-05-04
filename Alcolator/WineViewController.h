//
//  WineViewController.h
//  Alcolator
//
//  Created by Joe Lucero on 5/3/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WineViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (strong, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@end


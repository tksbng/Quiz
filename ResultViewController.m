//
//  ResultViewController.m
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController {
    IBOutlet UILabel *percentageLabel;
    IBOutlet UILabel *levelLabel;
    
    IBOutlet UIImageView *levelImage;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (_correctPercentage < 30 ){
        levelLabel.text = @"猿レベル";
        levelImage.image = [UIImage imageNamed:@"monkey.png"];
    } else if (_correctPercentage >= 30 && _correctPercentage < 90) {
        levelLabel.text = @"一般人レベル";
        levelImage.image = [UIImage imageNamed:@"human.png"];
    } else if (_correctPercentage >= 90){
        levelLabel.text = @"神レベル";
        levelImage.image = [UIImage imageNamed:@"god.png"];
    }
    percentageLabel.text = [NSString stringWithFormat:@"%d %%",_correctPercentage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

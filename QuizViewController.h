//
//  QuizViewController.h
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Problem.h"
#import "ResultViewController.h"
#import "Chime.h"

@interface QuizViewController : UIViewController
-(void)loadProblemSet;
-(void)shuffleProblemSet;
-(void)nextProblem;

@end

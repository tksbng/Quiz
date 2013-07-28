//
//  QuizViewController.m
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController{
    NSMutableArray *problemSet;
    
    int totalProblems;
    int currentProblem;
    int correctAnswers;
    Chime *chimeInstance;
    
    IBOutlet UITextView *problemText;
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
    chimeInstance = [Chime initChime];
    [self loadProblemSet];
    [self shuffleProblemSet];
    totalProblems = 10;
    currentProblem = 0;
    correctAnswers = 0;
    
    problemText.text = [[problemSet objectAtIndex:currentProblem] getQ];
}
-(void)nextProblem{
    currentProblem++;
    
    if(currentProblem < totalProblems){
        problemText.text = [[problemSet objectAtIndex:currentProblem] getQ];
    } else {
        [self performSegueWithIdentifier:@"toResultView"sender:self];
        
    }
}

//結果表示画面へのSegueの発動
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //正答率を算出
    int percentage = (correctAnswers * 100 / totalProblems) ;
    
    //ResultViewController（RVC）のインスタンスを作成し、
    //RVCクラスのメンバー変数である「correctPercentage」に値を渡す
    if ([[segue identifier] isEqualToString:@"toResultView"]) {
        ResultViewController *rvc = (ResultViewController*)[segue destinationViewController];
        rvc.correctPercentage = percentage;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadProblemSet {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"quiz" ofType:@"csv"];
    NSError* error = nil;
    int enc = NSUTF8StringEncoding;
    NSString* text = [NSString stringWithContentsOfFile:path encoding:enc error:&error];
    NSArray* lines = [text componentsSeparatedByString:@"\n"];
    
    problemSet = [[NSMutableArray alloc] init];
    for(int i = 0; i <[lines count]; i++){
        NSArray* items = [[lines objectAtIndex:i] componentsSeparatedByString:@","];
        
        Problem *p = [Problem initProblem];
        NSString *q = [items objectAtIndex:0];
        int a = [[items objectAtIndex:1] intValue];
        [p setQ:q withA:a];
        [problemSet addObject:p];
    }
}
-(void)shuffleProblemSet{
    int totalQuestions = [problemSet count];
    int i = totalQuestions;
    
    while (i > 0) {
        srand((unsigned int) time(0));
        int j = rand()  % i;
        [problemSet exchangeObjectAtIndex:(i-1) withObjectAtIndex:j];
        i = i - 1;
        
    }
    
    
}
-(IBAction)answerIsTrue:(id)sender
{
    if ([[problemSet objectAtIndex:currentProblem] getA] == 0){
        correctAnswers++;
        [chimeInstance play];
    } else {
        [chimeInstance playFalse];
    }
    [self nextProblem];
}
-(IBAction)answerIsFalse:(id)sender
{
    if ([[problemSet objectAtIndex:currentProblem] getA] == 1) {
        correctAnswers++;
        [chimeInstance play];
    } else {
        [chimeInstance playFalse];
    }
    [self nextProblem];
}
@end

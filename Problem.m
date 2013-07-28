//
//  Problem.m
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import "Problem.h"

@implementation Problem {
    NSString *question;
    int answer;
}

+(id)initProblem {
    return [[self alloc] init];
}

-(void)setQ:(NSString *)q withA:(int)a {
    question = q;
    answer = a;
}

-(NSString *)getQ {
    return question;
}
-(int)getA {
    return answer;
}

@end

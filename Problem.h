//
//  Problem.h
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Problem : NSObject
+(id)initProblem;
-(void)setQ:(NSString *)q withA:(int)a;
-(NSString *)getQ;
-(int)getA;
@end

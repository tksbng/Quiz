//
//  Chime.h
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/28.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Chime : NSObject
+ (id)initChime;
-(void)play;
-(void)playFalse;
@end

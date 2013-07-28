//
//  chime.m
//  Quiz
//
//  Created by Takeshi Bingo on 2013/07/28.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import "Chime.h"

@implementation Chime {
    //音のファイルの所在を示すURL
    CFURLRef soundURL;
  //  CFURLRef soundURLFalse;
    //サウンドIDを生成
    SystemSoundID soundID;
    SystemSoundID soundIDFalse;

}
//初期化処理
+ (id)initChime {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    [self setSound];
    [self setSoundFalse];
    return self;
}

//音ファイルを読み込んで設定
-(void)setSound {
    //ファイルを読み込んで、soundURLを生成
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    soundURL = CFBundleCopyResourceURL(mainBundle, CFSTR("se_maoudamashii_chime13"),CFSTR("wav"), nil);
    //soundURLをもとに、soundIDを生成
    AudioServicesCreateSystemSoundID(soundURL, &soundID);
}
//不正解の音
-(void)setSoundFalse {
    //ファイルを読み込んで、soundURLを生成
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    soundURL = CFBundleCopyResourceURL(mainBundle, CFSTR("se_maoudamashii_onepoint33"),CFSTR("wav"), nil);
    //soundURLをもとに、soundIDFalseを生成
    AudioServicesCreateSystemSoundID(soundURL, &soundIDFalse);
}

//soundIDを再生
-(void)play {
    AudioServicesPlaySystemSound(soundID);
}
-(void)playFalse {
    AudioServicesPlaySystemSound(soundIDFalse);
}

@end

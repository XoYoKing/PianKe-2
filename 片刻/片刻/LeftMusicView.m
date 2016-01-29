//
//  LeftMusicView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "LeftMusicView.h"
#import "Masonry.h"
#import <AVFoundation/AVFoundation.h>


@implementation LeftMusicView



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.musicName];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicFrom];
        [self addSubview:self.startBtn];
        [self addLayout];
        
        NSError* error = nil;
        
        // 应用程序束  Bundle路径 只支持读取
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"TokyoHot" ofType:@"mp3"];
        
        NSURL* url = [NSURL fileURLWithPath:filePath];
        
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    }
    return self;
}

- (void)addLayout{
    
    WS(weakSelf);
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(60);
//   make.edges.equalTo(weakSelf).with.insets.(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backBtn.mas_left).offset(10);
        make.top.equalTo(self.backBtn.mas_top).offset(10);
        make.size.equalTo(CGSizeMake(40, 40));
        
    }];
    
    [self.musicName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.musicImage.mas_right).offset(20);
        make.top.equalTo(self.backBtn.mas_top).offset(13);
        make.right.equalTo(self.startBtn.mas_left).offset(-10);
        make.height.equalTo(20);

    }];
    
    [self.musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.musicImage.mas_right).offset(20);
        make.top.equalTo(self.musicName.mas_bottom);
        make.right.equalTo(self.startBtn.mas_left).offset(-10);
        make.height.equalTo(10);
    }];
    
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.backBtn.mas_right).offset(-65);
        make.centerY.equalTo(self.backBtn.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    
}

- (UIImageView *)musicImage{
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"音乐"]];
    }
    return _musicImage;
}

- (UILabel *)musicName{
    if (!_musicName) {
        _musicName = [[UILabel alloc] init];
        _musicName.textColor = [UIColor whiteColor];
        _musicName.text = @"Tokyo Hot";
        _musicName.textAlignment = NSTextAlignmentLeft;
        _musicName.font = [UIFont systemFontOfSize:15.0];
    }
    return _musicName;
}

- (UILabel *)musicFrom{
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc] init];
        _musicFrom.textColor = [UIColor whiteColor];
        _musicFrom.text = @"小哲玛利亚";
        _musicFrom.textAlignment = NSTextAlignmentLeft;
        _musicFrom.font = [UIFont systemFontOfSize:10.0];
    }
    return _musicFrom;
}

- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.selected = NO;
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
        _startBtn.contentMode = UIViewContentModeCenter;
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateSelected];
        [_startBtn addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _startBtn;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = RGB(28, 28, 28);
    }
    return _backBtn;
}

- (void)playMusic:(UIButton*)sender{
    
    sender.selected = !sender.selected;
    if ([self.player isPlaying]) {
        [self.player stop];
    }else {
        [self.player play];}

}
@end










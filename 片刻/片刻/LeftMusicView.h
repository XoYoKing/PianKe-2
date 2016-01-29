//
//  LeftMusicView.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LeftMusicView : UIView


@property (strong,nonatomic) UIImageView* musicImage;
@property (strong,nonatomic) UILabel* musicName;
@property (strong,nonatomic) UILabel* musicFrom;
@property (strong,nonatomic) UIButton* startBtn;
@property (strong,nonatomic) UIButton* backBtn;

@property (strong, nonatomic) AVAudioPlayer* player;

@end

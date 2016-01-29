//
//  ReadingView.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface ReadingView : UIView

@property (strong,nonatomic) UIScrollView* topScrollView;

@property (strong,nonatomic) UIButton* footBtn;


@property (strong,nonatomic) SDCycleScrollView* scrollView;
@end

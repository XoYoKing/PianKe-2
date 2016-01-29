//
//  FirstView.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstView : UIView

@property (strong,nonatomic) UIButton* sexBtnOne;
@property (strong,nonatomic) UIButton* sexBtnTwo;

@property (strong,nonatomic) UIView* lineOne;
@property (strong,nonatomic) UIView* lineTwo;
@property (strong,nonatomic) UIView* lineThree;

@property (strong,nonatomic) UILabel* nameLabel;
@property (strong,nonatomic) UILabel* emailLabel;
@property (strong,nonatomic) UILabel* passLabel;

@property (strong,nonatomic) UITextField* textOne;
@property (strong,nonatomic) UITextField* textTwo;
@property (strong,nonatomic) UITextField* textThree;

@property (strong,nonatomic) UIButton* registerBtn;

@end

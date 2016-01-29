//
//  SecondLogonView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SecondLogonView.h"
#import "Masonry.h"
@implementation SecondLogonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.lineOne];
        [self addSubview:self.lineTwo];
        [self addSubview:self.logonOne];
        [self addSubview:self.logonTwo];
        [self addSubview:self.textOne];
        [self addSubview:self.textTwo];
        [self addSubview:self.logon];
        [self addLayout];
        
    }
    return self;
}

- (void)addLayout{
    WS(weakSelf);
    
    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(weakSelf.mas_top).offset(55);
        make.height.equalTo(0.5);
      
    }];
    
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(self.lineOne.mas_bottom).offset(55);
        make.height.equalTo(0.5);
        
    }];
    
    [self.logonOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineOne.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(self.lineOne.mas_top).offset(-10);
    }];
    
    [self.logonTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineOne.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(self.lineTwo.mas_top).offset(-10);
    }];

    [self.textOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logonOne.mas_right).offset(5);
        make.right.equalTo(self.lineOne.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(self.lineOne.mas_top);
    }];
    
    [self.textTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logonTwo.mas_right).offset(5);
        make.right.equalTo(self.lineOne.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(self.lineTwo.mas_top);
    }];

    [self.logon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(30);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(self.lineTwo.mas_bottom).offset(25);
    }];
    
}

- (UIView *)lineOne{
    if (!_lineOne) {
        _lineOne = [[UIView alloc] init];
        [_lineOne setBackgroundColor:[UIColor grayColor]];
    }
    return _lineOne;
}

- (UIView *)lineTwo{
    if (!_lineTwo) {
        _lineTwo = [[UIView alloc] init];
        [_lineTwo setBackgroundColor:[UIColor grayColor]];
    }
    return _lineTwo;
}

- (UILabel *)logonOne{
    if (!_logonOne) {
        _logonOne = [[UILabel alloc] init];
        _logonOne.text = @"邮箱:";
        _logonOne.textAlignment = NSTextAlignmentCenter;
        _logonOne.font = [UIFont systemFontOfSize:13.0];
    }
    return _logonOne;
}

- (UILabel *)logonTwo{
    if (!_logonTwo) {
        _logonTwo = [[UILabel alloc] init];
        _logonTwo.text = @"密码:";
        _logonTwo.textAlignment = NSTextAlignmentCenter;
        _logonTwo.font = [UIFont systemFontOfSize:13.0];
    }
    return _logonTwo;
}

- (UITextField *)textOne{
    if (!_textOne) {
        _textOne = [[UITextField alloc] init];
        
    }
    return _textOne;
}

- (UITextField *)textTwo{
    if (!_textTwo) {
        _textTwo = [[UITextField alloc] init];
        _textTwo.secureTextEntry = YES;
        _textTwo.delegate = self;
        _textTwo.borderStyle = UITextBorderStyleNone;
    }
    return _textTwo;
}

- (UIButton *)logon{
    if (!_logon) {
        _logon = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logon setBackgroundColor:RGB(119, 182, 69)];
        [_logon setTitle:@"登录" forState:UIControlStateNormal];
        
    }
    return _logon;
}

@end










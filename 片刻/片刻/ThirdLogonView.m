//
//  ThirdLogonView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ThirdLogonView.h"
#import "Masonry.h"
@implementation ThirdLogonView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
        [self addSubview:self.label];
        [self addSubview:self.weiBo];
        [self addSubview:self.renRen];
        [self addSubview:self.douBan];
        [self addSubview:self.QQ];
        [self addLayout];
    }
    return self;
}


- (void)addLayout{
    WS(weakSelf);
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.top.equalTo(weakSelf.mas_top).offset(20);
        make.height.equalTo(0.5);
        make.right.equalTo(self.label.mas_left).offset(-5);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.leftView.mas_centerY);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.equalTo(CGSizeMake(80, 10));
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label.mas_right).offset(5);
        make.height.equalTo(0.5);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.centerY.equalTo(self.label.mas_centerY);
    }];
      CGFloat margin = (VIEW_WIDTH-80-4*25)/3;
    
    [self.weiBo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-30);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    
    [self.renRen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.weiBo.mas_right).offset(margin);
        make.centerY.equalTo(self.weiBo.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    
    [self.douBan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.renRen.mas_right).offset(margin);
        make.centerY.equalTo(self.weiBo.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    
    [self.QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.douBan.mas_right).offset(margin);
        make.centerY.equalTo(self.weiBo.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = [UIColor grayColor];
    }
    return _leftView;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"合作伙伴登录片刻";
        _label.font = [UIFont systemFontOfSize:10];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = [UIColor grayColor];

    }
    return _rightView;
}

- (UIButton *)weiBo{
    if (!_weiBo) {
        _weiBo = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weiBo setImage:[UIImage imageNamed:@"新浪"] forState:UIControlStateNormal];
    }
    return _weiBo;
}

- (UIButton *)renRen{
    if (!_renRen) {
        _renRen = [UIButton buttonWithType:UIButtonTypeCustom];
         [_renRen setImage:[UIImage imageNamed:@"人人"] forState:UIControlStateNormal];
    }
    return _renRen;
}

- (UIButton *)douBan{
    if (!_douBan) {
        _douBan = [UIButton buttonWithType:UIButtonTypeCustom];
         [_douBan setImage:[UIImage imageNamed:@"豆瓣"] forState:UIControlStateNormal];
    }
    return _douBan;
}

- (UIButton *)QQ{
    if (!_QQ) {
        _QQ = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QQ setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    }
    return _QQ;
}








@end

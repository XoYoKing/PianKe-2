//
//  TopView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TopView.h"
#import "Masonry.h"
@implementation TopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineOne];
        [self addSubview:self.lineTwo];
        [self addSubview:self.menuBtn];
        [self addSubview:self.titleLabel];
        [self addSubview:self.suiPian];
        [self addSubview:self.riQi];
        [self addSubview:self.dongTai];
        [self addSubview:self.line];
        [self addLayout];
        
    }
    return self;
}

- (void)addLayout{
    WS(weakSelf);
    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(45);
        make.top.equalTo(weakSelf.mas_top);
        make.size.equalTo(CGSizeMake(0.5, 45));
        
    }];
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(45);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(0.5);
        
    }];
    
    [self.menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(2.5);
        make.top.equalTo(weakSelf.mas_top).offset(2.5);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.lineOne.mas_right).offset(2.5);
        make.top.equalTo(weakSelf.mas_top).offset(2.5);
        make.size.equalTo(CGSizeMake(80, 40));

    }];
    [self.dongTai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(weakSelf.mas_top).offset(2.5);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    [self.riQi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dongTai.mas_left).offset(-10);
        make.top.equalTo(weakSelf.mas_top).offset(2.5);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    [self.suiPian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.riQi.mas_left).offset(-10);
        make.top.equalTo(weakSelf.mas_top).offset(2.5);
        make.size.equalTo(CGSizeMake(40, 40));

        
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineTwo.mas_top);
        make.left.equalTo(self.suiPian.mas_left).offset(15);
        make.size.equalTo(CGSizeMake(10, 1));
    }];
    
    
    
    
    
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        [_line setBackgroundColor:[UIColor blackColor]];
        
    }
    return _line;
}

- (UIView *)lineOne{
    if (!_lineOne) {
        _lineOne = [[UIView alloc]init];
        [_lineOne setBackgroundColor:[UIColor grayColor]];
    }
    return _lineOne;
}

- (UIView *)lineTwo{
    if (!_lineTwo) {
        _lineTwo = [[UIView alloc]init];
        [_lineTwo setBackgroundColor:[UIColor grayColor]];
    }
    return _lineTwo;
}

- (UIButton *)menuBtn{
    if (!_menuBtn) {
        _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_menuBtn setImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
        _menuBtn.contentMode = UIViewContentModeCenter;
    }
    return _menuBtn;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"碎片";
    }
    return _titleLabel;
}

- (UIButton *)suiPian{
    if (!_suiPian) {
        _suiPian = [UIButton buttonWithType:UIButtonTypeCustom];
        [_suiPian setImage:[UIImage imageNamed:@"nav碎片"] forState:UIControlStateNormal];
        [_suiPian setImage:[UIImage imageNamed:@"nav碎片_sel"] forState:UIControlStateSelected];
        _suiPian.contentMode = UIViewContentModeCenter;
    }
    return _suiPian;
}

- (UIButton *)riQi{
    if (!_riQi) {
        _riQi = [UIButton buttonWithType:UIButtonTypeCustom];
        [_riQi setImage:[UIImage imageNamed:@"nav旗1"] forState:UIControlStateNormal];
         [_riQi setImage:[UIImage imageNamed:@"nav旗1_sel"] forState:UIControlStateSelected];
        _riQi.contentMode = UIViewContentModeCenter;
    }
    return _riQi;
}

- (UIButton *)dongTai{
    if (!_dongTai) {
        _dongTai = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dongTai setImage:[UIImage imageNamed:@"nav雷电"] forState:UIControlStateNormal];
        [_dongTai setImage:[UIImage imageNamed:@"nav雷电_sel"] forState:UIControlStateSelected];
        _dongTai.contentMode = UIViewContentModeCenter;
    }
    return _dongTai;
}

@end











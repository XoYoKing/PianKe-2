//
//  FirstView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "FirstView.h"
#import "Masonry.h"
@implementation FirstView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.sexBtnOne];
        [self addSubview:self.sexBtnTwo];
        [self addSubview:self.lineOne];
        [self addSubview:self.lineTwo];
        [self addSubview:self.lineThree];
        [self addSubview:self.nameLabel];
        [self addSubview:self.emailLabel];
        [self addSubview:self.passLabel];
        [self addSubview:self.textOne];
        [self addSubview:self.textTwo];
        [self addSubview:self.textThree];
        [self addSubview:self.registerBtn];
        [self addLayout];
    }
    return self;
}

- (void)addLayout{
    
    WS(weakSelf);
    
    [self.sexBtnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-60);
        make.size.equalTo(CGSizeMake(66,30));
    }];
    [self.sexBtnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(60);
        make.size.equalTo(CGSizeMake(66,30));
    }];
    
    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(weakSelf.mas_top).offset(80);
        make.height.equalTo(0.5);
        
    }];
    
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(self.lineOne.mas_bottom).offset(55);
        make.height.equalTo(0.5);
        
    }];
    
    [self.lineThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(self.lineTwo.mas_bottom).offset(55);
        make.height.equalTo(0.5);
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineOne.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(self.lineOne.mas_top).offset(-10);
    }];
    
    [self.emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineOne.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(self.lineTwo.mas_top).offset(-10);
    }];
    
    [self.passLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineOne.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(self.lineThree.mas_top).offset(-10);
    }];
    
    [self.textOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.right.equalTo(self.lineOne.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(self.lineOne.mas_top);
    }];
    
    [self.textTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.right.equalTo(self.lineOne.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(self.lineTwo.mas_top);
    }];

    
    [self.textThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.right.equalTo(self.lineOne.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(self.lineThree.mas_top);
    }];
    
    

    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(30);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(self.lineThree.mas_bottom).offset(25);
    }];


    
}

- (UIButton *)sexBtnOne{
    if (!_sexBtnOne) {
        _sexBtnOne = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sexBtnOne setImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
        [_sexBtnOne setImage:[UIImage imageNamed:@"男_sel"] forState:UIControlStateSelected];
        [_sexBtnOne addTarget:self action:@selector(sexBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        _sexBtnOne.selected = YES;
    }
    return _sexBtnOne;
}

- (UIButton *)sexBtnTwo{
    if (!_sexBtnTwo) {
        _sexBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sexBtnTwo setImage:[UIImage imageNamed:@"女"] forState:UIControlStateNormal];
        [_sexBtnTwo setImage:[UIImage imageNamed:@"女_sel"] forState:UIControlStateSelected];
         [_sexBtnTwo addTarget:self action:@selector(sexBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sexBtnTwo;
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

- (UIView *)lineThree{
    if (!_lineThree) {
        _lineThree = [[UIView alloc] init];
        [_lineThree setBackgroundColor:[UIColor grayColor]];
    }
    return _lineThree;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"昵称:";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:13.0];

    }
    return _nameLabel;
}

- (UILabel *)emailLabel{
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc] init];
        _emailLabel.text = @"邮箱:";
        _emailLabel.textAlignment = NSTextAlignmentCenter;
        _emailLabel.font = [UIFont systemFontOfSize:13.0];
        
    }
    return _emailLabel;
}
- (UILabel *)passLabel{
    if (!_passLabel) {
        _passLabel = [[UILabel alloc] init];
        _passLabel.text = @"密码:";
        _passLabel.textAlignment = NSTextAlignmentCenter;
        _passLabel.font = [UIFont systemFontOfSize:13.0];
        
    }
    return _passLabel;
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
        
    }
    return _textTwo;
}
- (UITextField *)textThree{
    if (!_textThree) {
        _textThree = [[UITextField alloc] init];
        _textThree.secureTextEntry = YES;
//        _textThree.delegate = self;
        _textThree.borderStyle = UITextBorderStyleNone;
    }
    return _textThree;
}


- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setBackgroundColor:RGB(119, 182, 69)];
        [_registerBtn setTitle:@"完成" forState:UIControlStateNormal];
            }
    return _registerBtn;
}

- (void)sexBtnPress:(UIButton*)sender{
    
    sender.selected = YES;
    for (UIButton* btn in [sender.superview subviews]) {
        if ([btn isMemberOfClass:[UIButton class]] && btn != sender) {
            btn.selected = NO;
        }
    }
    
}

@end








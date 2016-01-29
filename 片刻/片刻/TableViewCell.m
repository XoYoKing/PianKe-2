//
//  TableViewCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "TabelView.h"
@interface TableViewCell()<CellDelegate>


@end

@implementation TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.iconView];
        [self addSubview:self.userName];
        [self addSubview:self.detailLabel];
        [self addSubview:self.image];
        [self addSubview:self.line];
        [self addAutoLayout];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        
    }
    
    
    return self;
}

- (void)addAutoLayout{
    WS(weakSelf);
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(5);
        make.centerY.equalTo(self.iconView.mas_centerY);
        make.size.equalTo(CGSizeMake(120, 20));
    }];
    [self.image setFrame:CGRectMake(20, 45, VIEW_WIDTH-40, 50)];
//    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.iconView.mas_bottom).offset(5);
////        make.height.equalTo(5);
//        make.left.equalTo(weakSelf.mas_left).offset(20);
//        make.right.equalTo(weakSelf.mas_right).offset(-20);
//        make.bottom.equalTo(self.detailLabel.mas_top);
//    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.image.mas_bottom).offset(2);
        make.left.equalTo(self.iconView.mas_left);
        make.right.equalTo(weakSelf.mas_right).offset(-20);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.detailLabel.mas_bottom);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(0.5);
    }];
}

- (void)awakeFromNib {
    // Initialization code
}




-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.layer.cornerRadius = 15;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}
- (UILabel *)userName{
    if (!_userName) {
        _userName = [[UILabel alloc] init];
        _userName.font = [UIFont systemFontOfSize:13];
        _userName.contentMode = UIViewContentModeLeft;
    }
    return _userName;
}

-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:13];
        _detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

- (UIImageView *)image{
    if (!_image) {
        _image = [[UIImageView alloc] init];
    }
    return _image;
}

- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        [_line setBackgroundColor:[UIColor grayColor]];
    }
    return _line;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//代理方法
- (void)giveCellHeigh:(NSInteger)row{
    
}
@end

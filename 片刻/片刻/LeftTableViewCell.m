//
//  LeftTableViewCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/14.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "Masonry.h"
@implementation LeftTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.imageMenu];
        [self.contentView addSubview:self.labelMenu];
        self.backgroundColor = RGB(51, 51, 51);
        
    }
    
    return  self;
    
}
//每次创建cell都会调用（自动布局子视图）
- (void)layoutSubviews{
    CGFloat width = (VIEW_WIDTH-125)/5.0;
    
    WS(weakSelf);
    [self.imageMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
        
    }];
    
    [self.labelMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageMenu.mas_right).offset(25);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.equalTo(CGSizeMake(50, 25));
        
    }];
    
    
    
}

- (UIImageView *)imageMenu{
    if (!_imageMenu) {
        _imageMenu = [[UIImageView alloc] init];
    }
    return _imageMenu;
}
- (UILabel *)labelMenu{
    if (!_labelMenu) {
        _labelMenu = [[UILabel alloc] init];
        _labelMenu.textAlignment = NSTextAlignmentLeft;
        _labelMenu.textColor = [UIColor whiteColor];
        _labelMenu.font = [UIFont boldSystemFontOfSize:14];
    }
    return _labelMenu;
}

- (void)awakeFromNib {
    
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  RadioDetailTableViewCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RadioDetailTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation RadioDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.coverImg];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.play];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(UIImageView *)coverImg{
    if (!_coverImg) {
        _coverImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 45, 45)];
        
    }
    return _coverImg;
}
- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 190, 30)];
        _title.font = [UIFont systemFontOfSize:15];
        _title.textColor = [UIColor lightGrayColor];
    }
    return _title;
}

- (UIButton *)play{
    if (!_play) {
        _play = [UIButton buttonWithType:UIButtonTypeCustom];
        [_play setFrame:CGRectMake(VIEW_WIDTH-30, 45/2, 20, 20)];
        [_play setImage:[UIImage imageNamed:@"播放2"] forState:UIControlStateNormal];
        [_play setImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateSelected];
    }
    return _play;
}

- (void)setMessagrWithArray:(NSDictionary*)dic{
    
    [self.coverImg sd_setImageWithURL:[NSURL URLWithString:dic[@"coverimg"]]];
    self.title.text = dic[@"title"];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end








//
//  AllListTableViewCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/26.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "AllListTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation AllListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cover];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.uname];
        [self.contentView addSubview:self.desc];
        [self.contentView addSubview:self.line];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)setDataDic:(NSDictionary *)dataDic{
    
    [self.cover sd_setImageWithURL:[NSURL URLWithString:dataDic[@"coverimg"]]];
    
    [self.title setText:dataDic[@"title"]];
    
    [self.uname setText:[NSString stringWithFormat:@"by:%@",[dataDic[@"userinfo"] valueForKey:@"uname"]]];
    
    [self.desc setText:dataDic[@"desc"]];
    
}



- (UIImageView *)cover{
    if (!_cover) {
        _cover = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80, 80)];
    }
    return _cover;
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(90, 5, VIEW_WIDTH-180, 25)];
        _title.font = [UIFont systemFontOfSize:15];
    }
    return _title;
}

- (UILabel *)uname{
    if (!_uname) {
        _uname = [[UILabel alloc] initWithFrame:CGRectMake(90, 36, VIEW_WIDTH-200, 15)];
        _uname.font = [UIFont systemFontOfSize:12];
        [_uname setTextColor:RGB(63, 110, 116)];
    }
    return _uname;
}

- (UILabel *)desc{
    if (!_desc) {
        _desc = [[UILabel alloc] initWithFrame:CGRectMake(90, 65, VIEW_WIDTH-100, 15)];
        _desc.font = [UIFont systemFontOfSize:13];
        [_desc setTextColor:[UIColor lightGrayColor]];
    }
    return _desc;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 89.5, VIEW_WIDTH, 0.5)];
        [_line setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _line;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

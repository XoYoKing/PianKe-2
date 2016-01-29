//
//  GoodCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/21.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "GoodCell.h"

@implementation GoodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentImage  = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, VIEW_WIDTH-40, 140)];
        self.contentImage.image = [UIImage imageNamed:@"meimei"];
        [self addSubview:self.contentImage];
        
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, VIEW_WIDTH-100, 60)];
        self.contentLabel.font = [UIFont systemFontOfSize:14.0];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        self.contentLabel.tintColor = [UIColor blackColor];
        [self addSubview:self.contentLabel];
        
        self.buyLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_WIDTH-80, 175, 60, 25)];
        self.buyLabel.text = @"立即购买";
        self.buyLabel.textColor = [UIColor whiteColor];
        self.buyLabel.backgroundColor = RGB(119, 182, 69);
        self.buyLabel.font = [UIFont systemFontOfSize:13.0];
        self.buyLabel.textAlignment = NSTextAlignmentCenter;
        self.buyLabel.layer.cornerRadius = 12.5;
        self.buyLabel.layer.masksToBounds = YES;
        [self addSubview:self.buyLabel];
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 219, VIEW_WIDTH, 0.5)];
        self.lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.lineView];
    }
    
    
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

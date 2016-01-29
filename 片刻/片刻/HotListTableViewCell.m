//
//  HotListTableViewCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/26.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "HotListTableViewCell.h"
#import "UIButton+WebCache.h"
@implementation HotListTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.image1];
        [self.contentView addSubview:self.image2];
        [self.contentView addSubview:self.image3];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setNameStr:(NSArray *)nameStr{
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:[nameStr[0] valueForKey:@"coverimg"] ] forState:UIControlStateNormal];
    
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:[nameStr[1] valueForKey:@"coverimg"] ] forState:UIControlStateNormal];

    [self.image3 sd_setImageWithURL:[NSURL URLWithString:[nameStr[2] valueForKey:@"coverimg"] ] forState:UIControlStateNormal];

}

-(UIButton *)image1{
    if (!_image1) {
        _image1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_image1 setFrame:CGRectMake(10, 10, (VIEW_WIDTH-40)/3, (VIEW_WIDTH-40)/3)];
        [_image1 setBackgroundColor:[UIColor yellowColor]];
        [_image1 addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _image1;
}
-(UIButton *)image2{
    if (!_image2) {
        _image2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_image2 setFrame:CGRectMake((VIEW_WIDTH-40)/3+20, 10, (VIEW_WIDTH-40)/3, (VIEW_WIDTH-40)/3)];
        [_image2 setBackgroundColor:[UIColor yellowColor]];
                [_image2 addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _image2;
}
- (UIButton *)image3{
    if (!_image3) {
        _image3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_image3 setFrame:CGRectMake((VIEW_WIDTH-40)/3*2+30, 10, (VIEW_WIDTH-40)/3, (VIEW_WIDTH-40)/3)];
        [_image3 setBackgroundColor:[UIColor yellowColor]];
        [_image3 addTarget:self action:@selector(btnThree:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _image3;
}


- (void)btnOne:(UIButton*)sender{
    
    NSLog(@"1");
}
- (void)btnTwo:(UIButton*)sender{
    NSLog(@"2");

}
- (void)btnThree:(UIButton*)sender{
    NSLog(@"3");

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

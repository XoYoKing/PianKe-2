//
//  AllListTableViewCell.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/26.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllListTableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView* cover;
@property (strong,nonatomic) UILabel* title;
@property (strong,nonatomic) UILabel* uname;
@property (strong,nonatomic) UILabel* desc;
@property (strong,nonatomic) NSDictionary* dataDic;
@property (strong,nonatomic) UIView* line;
@end

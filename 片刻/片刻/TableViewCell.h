//
//  TableViewCell.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView* iconView;
@property (strong,nonatomic) UILabel* userName;
@property (strong,nonatomic) UILabel* detailLabel;
@property (strong,nonatomic) UIImageView* image;
@property (strong,nonatomic) UIView* line;

@end

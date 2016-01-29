//
//  RadioDetailTableViewCell.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioDetailTableViewCell : UITableViewCell


@property (strong,nonatomic) UIImageView* coverImg;

@property (strong,nonatomic) UILabel* title;

@property (strong,nonatomic) UIButton* play;


- (void)setMessagrWithArray:(NSDictionary*)dic;
@end

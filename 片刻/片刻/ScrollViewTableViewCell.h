//
//  ScrollViewTableViewCell.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewTableViewCell : UITableViewCell
@property (strong,nonatomic) UIScrollView* scrollView;
@property (strong,nonatomic) NSArray* imageArray;
@property (strong,nonatomic) UIPageControl* pageControll;
@property (strong,nonatomic) NSTimer* timer;
@end

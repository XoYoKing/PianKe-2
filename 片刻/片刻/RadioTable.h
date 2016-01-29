//
//  RadioTable.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioViewController.h"
typedef void(^loadMoreData)();
typedef void(^loadNewData)();
@interface RadioTable : UITableView
@property (strong,nonatomic) NSDictionary* dataDic;
@property (strong,nonatomic) NSMutableArray* dataArray;
@property (strong,nonatomic) loadMoreData loadMore;
@property (strong,nonatomic) loadNewData newData;
@property (strong,nonatomic) RadioViewController* controller;
@end

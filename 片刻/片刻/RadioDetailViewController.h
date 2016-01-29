//
//  RadioDetailViewController.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "BaseViewController.h"

@interface RadioDetailViewController : BaseViewController

@property (strong,nonatomic) UITableView* tableView;
@property (strong,nonatomic) NSString* radioId;
@property (strong,nonatomic) NSDictionary* topUIDic;

@end

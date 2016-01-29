//
//  RadioViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RadioViewController.h"
#import "RadioTable.h"
#import "MJRefresh.h"
@interface RadioViewController ()
@property (strong,nonatomic) RadioTable* tableView;
@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self creatTopUI];
    [self.view addSubview:self.tableView];
    [self POST];

    WS(weakSelf);
    self.tableView.newData = ^(){
      static  NSInteger star = 9;
        star+=9;
        [weakSelf POSTTWO:star];
    };
    

    
}
/*
 auth	W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI
 client	1
 deviceid	A55AF7DB-88C8-408D-B983-D0B9C9CA0B36
 limit	9
 start	9
 version	3.0.6
 */
- (void)POSTTWO:(NSInteger)star{

    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":@"9",
                                 @"start":[NSString stringWithFormat:@"%li",star],
                                 @"version":@"3.0.6"};

    [self POSTHttpRequest:@"http://api2.pianke.me/ting/radio_list" dic:requestDic successBalck:^(id JSON) {
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            
            NSArray* arrTemp = [returnDic[@"data"] valueForKey:@"list"];
            
            [self.tableView.dataArray addObjectsFromArray:arrTemp];

            [self.tableView.mj_footer endRefreshing];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
                
            });
        }
    } errorBlock:^(NSError *error) {
        
        
        
    }];
    
    
}
/*
 auth	W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI
 client	1
 deviceid	A55AF7DB-88C8-408D-B983-D0B9C9CA0B36
 version	3.0.6
 
 */
- (void)POST{
    NSDictionary* dic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                          @"client":@"1",@"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",@"version":@"3.0.6"};
    
    [self POSTHttpRequest:@"http://api2.pianke.me/ting/radio" dic:dic successBalck:^(id JSON) {
        
        NSDictionary* resultDic = JSON;
        if ([resultDic[@"result"] floatValue] == 1) {
//            NSLog(@"%@",JSON);
            self.tableView.dataDic = resultDic;
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
//            NSLog(@"%@",self.tableView.dataDic);
        });
        
    } errorBlock:^(NSError *error) {
        
    }];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(RadioTable *)tableView{
    if (!_tableView) {
        _tableView = [[RadioTable alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.controller = self;
    }
    return _tableView;
}

//头部UI
- (void)creatTopUI{
    UIView* viewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, 0.5)];
    [viewOne setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:viewOne];
    
    UIView* viewTwo = [[UIView alloc] initWithFrame:CGRectMake(45, 20, 0.5, 45)];
    [viewTwo setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:viewTwo];
    
    //返回按钮
    UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    backBtn.contentMode = UIViewContentModeCenter;
    [backBtn addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setFrame:CGRectMake(2.5, 22.5, 40, 40)];
    [self.view addSubview:backBtn];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(55, 25, 80, 35)];
    label.contentMode = UIViewContentModeCenter;
    label.text = @"电台";
    label.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:label];
    
    UILabel* label2= [[UILabel alloc] initWithFrame:CGRectMake(VIEW_WIDTH-90, 25, 80, 35)];
    label2.contentMode = UIViewContentModeCenter;
    label2.text = @"我要当主播";
    label2.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:label2];
}

//菜单按钮点击事件
- (void)returnAction:(UIButton*)sender{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}

@end














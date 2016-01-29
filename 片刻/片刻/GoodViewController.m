//
//  GoodViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "GoodViewController.h"
#import "GoodCell.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
@interface GoodViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (strong,nonatomic) UITableView* goodTableView;
@property (strong,nonatomic) NSMutableArray* dataSource;
@end

@implementation GoodViewController{

    NSInteger _start;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];

    [self creatTopUI];
    
    [self addRefreshControl];
    
    _start = 0;
    [self POST:0];
    
}

//MJ刷新
- (void)addRefreshControl{
    //头部
    MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(xialashuaxin)];
//    header.lastUpdatedTimeLabel.hidden = YES;
//
//    header.stateLabel.hidden = YES;
    
    self.goodTableView.mj_header = header;
    
    [header beginRefreshing];
    
    //下面
    MJRefreshFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    footer.stateLabel.hidden = YES;
//    self.goodTableView.mj_footer.automaticallyChangeAlpha = YES;
    self.goodTableView.mj_footer = footer;

    
}
- (void)xialashuaxin {
    [self.goodTableView.mj_header beginRefreshing];
    NSLog(@"----------------------->1111111");
//    [self.dataSource removeAllObjects];
    [self POST:_start];

//
}
- (void)loadMoreData {
    [self.goodTableView.mj_footer beginRefreshing];
    NSLog(@"--------------------------->22222222");
    [self POST:_start];

}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}
- (void)creatUI{
    self.goodTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT-65) style:UITableViewStylePlain];
    self.goodTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.goodTableView.delegate = self;
    self.goodTableView.dataSource = self;
    [self.view addSubview:self.goodTableView];
}
- (void)POST:(NSInteger)star{
    NSDictionary* dic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",@"client":@"1",@"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"limit":@"10",
                          @"start":[NSString stringWithFormat:@"%li",star],
                          @"version":@"3.0.6"};
    
    WS(weakSelf);
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop" dic:dic successBalck:^(id JSON) {
//        NSLog(@"%@", JSON);
        NSDictionary* resultDic = JSON;
//       8 NSLog(@"%@",JSON);
        //解析
        if ([resultDic[@"result"] integerValue]==1) {
            
            NSArray* array = [resultDic[@"data"] valueForKey:@"list"];
            
            for (NSDictionary* modelDic in array) {
                
                [self.dataSource addObject:modelDic];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.goodTableView reloadData];
            });
        }
        _start += 10; // 刷新
        [self.goodTableView.mj_footer endRefreshing];
        [self.goodTableView.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        
        NSLog(@"请求失败！");
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    label.text = @"良品";
    label.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:label];
}

//菜单按钮点击事件
- (void)returnAction:(UIButton*)sender{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}

#pragma mark-表格实现
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"%lu",self.dataSource.count);
    return self.dataSource.count;
    
}
//行高

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 220.0;
}
//cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"cell";
    
    GoodCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary* dataDic = self.dataSource[indexPath.row] ;
   [cell.contentImage downloadImage:dataDic[@"coverimg"]];
    cell.contentLabel.text = dataDic[@"title"];
    
    
    
    return cell;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

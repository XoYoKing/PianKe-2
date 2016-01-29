//
//  RadioDetailViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RadioDetailViewController.h"
#import "RadioDetailTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "MJRefresh.h"
@interface RadioDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UILabel* titleString;

@property (strong,nonatomic) NSMutableArray* dataArray;

@property (assign,nonatomic) NSInteger start;
@end

@implementation RadioDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT-65)];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: tableView];

    [self POST];
    [self creatTopUI];
    
    [self addRefresh];
}

- (void)addRefresh{
    
    
    MJRefreshHeader* header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(newData)];
    self.tableView.mj_header = header;
    
    
    MJRefreshFooter* fooder = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(moreData)];
    
    self.tableView.mj_footer = fooder;
}

- (void)newData{
    self.start = 0;
    [self POST];
    
}
- (void)moreData{
    [self.tableView.mj_footer beginRefreshing];
    
    self.start+=10;
    
    [self POSTTWO:self.start];
}

- (void)creatUI{
    
    
    [self.tableView registerClass:[RadioDetailTableViewCell class] forCellReuseIdentifier:@"cell"];
    //表格头部
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_HEIGHT, 250)];
    [self.tableView setTableHeaderView:topView];
    
    //大图
    UIImageView* coverImage = [[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 150)];
    [coverImage sd_setImageWithURL:[NSURL URLWithString:self.topUIDic[@"coverimg"]]];
    [topView addSubview:coverImage];
    
    //头像
    UIButton* iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [iconBtn setFrame:CGRectMake(33/2, 35/2+150, 25, 25)];
    [iconBtn sd_setImageWithURL:[NSURL URLWithString:[self.topUIDic[@"userinfo"] valueForKey:@"icon"]] forState:UIControlStateNormal];
    iconBtn.layer.cornerRadius = 25/2;
    iconBtn.layer.masksToBounds = YES;
    [topView addSubview:iconBtn];
    
    //userName
    UILabel* userName = [[UILabel alloc] initWithFrame:CGRectMake(47, 35/3+160, 250, 15)];
    userName.text = [self.topUIDic[@"userinfo"] valueForKey:@"uname"];
    [userName setTextColor:[UIColor lightGrayColor]];
    userName.font = [UIFont systemFontOfSize:15.0];
    [topView addSubview:userName];
    
    //desc
    UILabel* descLabel = [[UILabel alloc] initWithFrame:CGRectMake(33/2, 35/2+200, 250, 30)];
    descLabel.text = self.topUIDic[@"desc"];
    [descLabel setTextColor:[UIColor lightGrayColor]];
    descLabel.font = [UIFont systemFontOfSize:15];
    [topView addSubview:descLabel];
}


/*auth	W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI
 client	1
 deviceid	A55AF7DB-88C8-408D-B983-D0B9C9CA0B36
 radioid	56580dad723125d1178b45c7
 version	3.0.6*/
-(void)POST{
    NSDictionary* dic= @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",@"client":@"1",@"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",@"radioid":self.radioId,@"version":@"3.0.6"};
    
    [self POSTHttpRequest:@"http://api2.pianke.me/ting/radio_detail" dic:dic successBalck:^(id JSON) {
        NSDictionary* result = JSON;
        if ([result[@"result"] integerValue]==1) {
            
//            NSLog(@"%@",[result[@"data"] valueForKey:@"radioInfo"]);
            
            self.topUIDic = [result[@"data"] valueForKey:@"radioInfo"];
            [self.dataArray removeAllObjects];
            
            NSArray* arr = [result[@"data"] valueForKey:@"list"];
            [self.dataArray addObjectsFromArray:arr] ;
            [self.tableView.mj_header endRefreshing];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self creatUI];
                self.titleString.text = self.topUIDic[@"title"];
                [self.tableView reloadData];
                
            });
            
        }
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}
/*auth	W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI
 client	1
 deviceid	A55AF7DB-88C8-408D-B983-D0B9C9CA0B36
 limit	10
 radioid	56580dad723125d1178b45c7
 start	10
 version	3.0.6*/
- (void)POSTTWO:(NSInteger)start{
    
    NSDictionary* dic= @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",@"client":@"1",@"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",@"limit":@"10",@"radioid":self.radioId,@"start":[NSString stringWithFormat:@"%li",start],@"version":@"3.0.6"};

    [self POSTHttpRequest:@"http://api2.pianke.me/ting/radio_detail_list" dic:dic successBalck:^(id JSON) {
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            
            NSArray* arrayTemp = [returnDic[@"data"] valueForKey:@"list"];
            
            [self.dataArray addObjectsFromArray:arrayTemp];
            
//            NSLog(@"%@",arrayTemp);
            [self.tableView.mj_footer endRefreshing];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
            
        }
        
    } errorBlock:^(NSError *error) {
        
    }];
    
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
    UIButton* backBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn2 setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    backBtn2.contentMode = UIViewContentModeCenter;
    [backBtn2 addTarget:self action:@selector(returnActionTwo:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn2 setFrame:CGRectMake(2.5, 22.5, 40, 40)];
    [self.view addSubview:backBtn2];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(55, 25, 80, 35)];
    label.contentMode = UIViewContentModeCenter;
    label.text = @"";
    label.font = [UIFont systemFontOfSize:13.0];
    self.titleString = label;
    [self.view addSubview:label];
    
   }

//菜单按钮点击事件
- (void)returnActionTwo:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark-表格
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"--------------------->%li",self.dataArray.count);
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cell";
    
    RadioDetailTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    [cell setMessagrWithArray:self.dataArray[indexPath.row]];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
//        _dataArray = [[NSMutableArray alloc] init];
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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

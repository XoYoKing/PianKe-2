//
//  RadioTable.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RadioTable.h"
#import "MJRefresh.h"
#import "ScrollViewTableViewCell.h"
#import "HotListTableViewCell.h"
#import "AllListTableViewCell.h"
#import "MJRefresh.h"
#import "RadioDetailViewController.h"
@interface RadioTable()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation RadioTable


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ScrollViewTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self registerClass:[HotListTableViewCell class] forCellReuseIdentifier:@"cell2"];
        [self registerClass:[AllListTableViewCell class] forCellReuseIdentifier:@"cell3"];
        [self refresh];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
//刷新
- (void)refresh{
    
    MJRefreshFooter* footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.mj_footer = footer;
    [self.mj_footer endRefreshing];
}
- (void)loadMoreData{
        _newData();
    
    NSLog(@"11111111111111");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return VIEW_WIDTH/2;
    }
    else if(indexPath.section == 1){
        return 20+(VIEW_WIDTH-40)/3;}else{
            return 90;
        }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        NSArray* arr = [self.dataDic[@"data"] valueForKey:@"alllist"];
        return arr.count+self.dataArray.count;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"cell";

    if (indexPath.section == 0) {
        identifier = @"cell";
    }
    if (indexPath.section == 1) {
        identifier = @"cell2";
    }
    if (indexPath.section == 2) {
        identifier = @"cell3";
    }
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        ScrollViewTableViewCell* newCell = (ScrollViewTableViewCell*)(cell);
        newCell.imageArray = [self.dataDic[@"data"] valueForKey:@"carousel"];
    }
    if (indexPath.section == 1) {
        HotListTableViewCell* cellTwo = (HotListTableViewCell*)(cell);
        cellTwo.nameStr = [self.dataDic[@"data"] valueForKey:@"hotlist"];
       
    }

    if (indexPath.section == 2) {
        AllListTableViewCell* cellThree = (AllListTableViewCell*)(cell);
        
        NSMutableArray* arr = [[NSMutableArray alloc] init];
        
      [arr addObjectsFromArray:[self.dataDic[@"data"] valueForKey:@"alllist"]];
        
        NSArray* temp = [NSArray arrayWithArray:self.dataArray];
      
        [arr addObjectsFromArray:temp];
        cellThree.dataDic = arr[indexPath.row];
    }
    return cell;
    
}
//头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 2) {
        return 25.0f;
    }
        return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2 ) {
        UIView* backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 25)];
        [backView setBackgroundColor:[UIColor whiteColor]];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 25)];
        [label setText:@"   全部电台·All Radios"];
        label.font = [UIFont systemFontOfSize:10];
        [label setTextColor:[UIColor lightGrayColor]];
        [backView addSubview:label];
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(110, 15, VIEW_WIDTH-110, 0.5)];
        [line setBackgroundColor:[UIColor lightGrayColor]];
        [backView addSubview:line];
        return backView;
        
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    [arr addObjectsFromArray:[self.dataDic[@"data"] valueForKey:@"alllist"]];
    
    NSArray* temp = [NSArray arrayWithArray:self.dataArray];
    
    [arr addObjectsFromArray:temp];

    RadioDetailViewController* detail = [[RadioDetailViewController alloc] init];
    
    detail.radioId = [arr[indexPath.row] valueForKey:@"radioid"];
    
    [self.controller.navigationController pushViewController:detail animated:YES];

}
@end









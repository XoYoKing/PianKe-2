//
//  SettingViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTopUI];
    [self creatFootUI];
    [self creatTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
    [backBtn addTarget:self action:@selector(returnLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setFrame:CGRectMake(2.5, 22.5, 40, 40)];
    [self.view addSubview:backBtn];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(55, 25, 80, 35)];
    label.contentMode = UIViewContentModeCenter;
    label.text = @"设置";
    label.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:label];
}

//菜单按钮点击事件
- (void)returnLeftMenu:(UIButton*)sender{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}

- (void)creatFootUI{
 
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((VIEW_WIDTH-100)/2, VIEW_HEIGHT-15, 100, 15)];
    label.contentMode = UIViewContentModeCenter;
    label.text = @"当前版本：V3.0.6";
    label.font = [UIFont systemFontOfSize:10.0];
    label.textColor = [UIColor lightGrayColor];
    [self.view addSubview:label];

}

- (void)creatTable{
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, 455)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else if (section==1){
        return 4;}
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.001f;
    }
    
    return 25.0f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray* array = @[@"通用设置",@"推荐片刻",@"给个好评",@"关于片刻",@"意见反馈",@"常见问题",@"使用指南",@"退出当前账号"];
    if (indexPath.section == 0) {
        cell.textLabel.text = array[indexPath.row];
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = array[indexPath.row+3];

    }
    if (indexPath.section == 2) {
        cell.textLabel.text = array[indexPath.row+7];
        
    }
//    cell.textLabel.textColor = [UIColor lightGrayColor];
    

    return cell;
}
@end








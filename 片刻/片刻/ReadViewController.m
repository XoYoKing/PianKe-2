//
//  ReadViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ReadViewController.h"
#import "ReadingView.h"
#import "UIButton+WebCache.h"
@interface ReadViewController ()
@property (strong,nonatomic) ReadingView* backView;
@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTopUI];
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT-65)];
    [scrollView setContentSize:CGSizeMake(VIEW_WIDTH, VIEW_HEIGHT+10)];
    [scrollView setContentOffset:CGPointMake(0, 0)];
    scrollView.pagingEnabled = NO;
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView addSubview:self.backView];
    [self.view addSubview:scrollView];
    
    [self POST];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (ReadingView *)backView{
    if (!_backView) {
        _backView = [[ReadingView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT+10)];

    }
    return _backView;
}

- (void)POST{
    NSDictionary* dic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",@"client":@"1",@"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",@"version":@"3.0.6"};
    [self POSTHttpRequest:@"http://api2.pianke.me/read/columns" dic:dic successBalck:^(id JSON) {
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            //轮播
           NSArray* arr = [returnDic[@"data"] valueForKey:@"carousel"];
            NSMutableArray* array = [NSMutableArray array];
            for (NSDictionary*data in arr) {
                NSString* str = data[@"img"];
                [array addObject:str];
            }
            self.backView.scrollView.imageURLStringsGroup= array;
            //9宫格
            NSArray* dataNine = [returnDic[@"data"]valueForKey:@"list"];
            NSMutableArray* arrayTwo = [NSMutableArray array];
            NSMutableArray* arrayThr = [NSMutableArray array];
            NSMutableArray* arrayFor = [NSMutableArray array];
            for (NSDictionary*dataTwo in dataNine) {
                NSString* strTwo = dataTwo[@"coverimg"];
                NSString* strThr = dataTwo[@"name"];
                NSString* strFor = dataTwo[@"enname"];
                [arrayTwo addObject:strTwo];
                [arrayThr addObject:strThr];
                [arrayFor addObject:strFor];
            }

            for (int i=0; i<9; i++) {
                UIButton* btn = [self.backView viewWithTag:10001+i];
                [btn sd_setImageWithURL:[NSURL URLWithString:arrayTwo[i]] forState:UIControlStateNormal];
                
                UILabel* labelOne = [self.backView viewWithTag:11001+i];
                labelOne.text = arrayThr[i];
                
                UILabel* labelTwo = [self.backView viewWithTag:12001+i];
                labelTwo.text = arrayFor[i];


            }
            
            
            //22222
            
            
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
    [backBtn addTarget:self action:@selector(returnMenu:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setFrame:CGRectMake(2.5, 22.5, 40, 40)];
    [self.view addSubview:backBtn];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(55, 25, 80, 35)];
    label.contentMode = UIViewContentModeCenter;
    label.text = @"阅读";
    label.font = [UIFont systemFontOfSize:13.0];
    [self.view addSubview:label];
}

//菜单按钮点击事件
- (void)returnMenu:(UIButton*)sender{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}
@end

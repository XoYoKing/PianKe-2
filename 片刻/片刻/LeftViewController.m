//
//  LeftViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/13.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftHeadView.h"
#import "LeftTabelView.h"
#import "LeftMusicView.h"
#import "LogonViewController.h"
#import "MomentoViewController.h"
#import "HomeViewController.h"
#import "RadioViewController.h"
#import "ReadViewController.h"
#import "ZoneViewController.h"
#import "GoodViewController.h"
#import "SettingViewController.h"
#import "GoodViewController.h"
#define HEIGHT [[UIScreen mainScreen]bounds].size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width
#import "Masonry.h"
@interface LeftViewController ()<LeftTabelViewSelectRow>

@property (strong,nonatomic)LeftHeadView* leftHeadView;
@property (strong,nonatomic)LeftTabelView* leftTabel;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
       //添加左边头部
    [self.view addSubview:self.leftHeadView];

    //头部约束
    WS(weakSelf);
    [self.leftHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(180);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
    }];
    //添加左边的表格菜单
    [self.view addSubview:self.leftTabel];
    
    
    //添加底部播放条
    LeftMusicView* leftMusicView = [[LeftMusicView alloc] initWithFrame:CGRectMake(0,VIEW_HEIGHT-60, VIEW_WIDTH, 60)];
    [self.view addSubview:leftMusicView];
    
    
    
    
   }

-(void)changePageWithRow:(NSInteger)row{
    
    switch (row) {
        case 0:
        {
        
            [self.sideMenuViewController setContentViewController:[[HomeViewController alloc]init] animated:YES];
            
                [self.sideMenuViewController hideMenuViewController];
        }
            break;
            
        case 1:
        {
            
            UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[RadioViewController alloc]init]];
            
                [self.sideMenuViewController setContentViewController:nav animated:YES];
            
            
                [self.sideMenuViewController hideMenuViewController];

        }
            break;
        case 2:
        {
            
            [self.sideMenuViewController setContentViewController:[[ReadViewController alloc]init] animated:YES];
            
            [self.sideMenuViewController hideMenuViewController];        }
            break;
        case 3:
        {
            
            [self.sideMenuViewController setContentViewController:[[ZoneViewController alloc]init] animated:YES];
            
            [self.sideMenuViewController hideMenuViewController];        }
            break;
        case 4:
        {
            
            [self.sideMenuViewController setContentViewController:[[MomentoViewController alloc]init] animated:YES];
            
            [self.sideMenuViewController hideMenuViewController];        }
            break;
        case 5:
        {
            
            [self.sideMenuViewController setContentViewController:[[GoodViewController alloc]init] animated:YES];
            
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 6:
        {
            
            [self.sideMenuViewController setContentViewController:[[SettingViewController alloc]init] animated:YES];
            
            [self.sideMenuViewController hideMenuViewController];        }
            break;
            
        default:
            break;
    }
    
}



//左边头部
- (LeftHeadView*)leftHeadView{
    if (!_leftHeadView) {
    
        _leftHeadView = [[LeftHeadView alloc]init];
        [_leftHeadView.iconImageBtn addTarget:self action:@selector(pushTologonViewController) forControlEvents:UIControlEventTouchUpInside];
        [_leftHeadView.userNameBtn addTarget:self action:@selector(pushTologonViewController) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _leftHeadView;
}

//左侧的表格
- (LeftTabelView *)leftTabel{
    
    if (!_leftTabel) {
        _leftTabel = [[LeftTabelView alloc] initWithFrame:CGRectMake(0, 180, VIEW_WIDTH-45, VIEW_HEIGHT-180-60) style:UITableViewStylePlain];
        _leftTabel.delegateOfRow = self;
    }
    return _leftTabel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushTologonViewController{
    LogonViewController* logon = [[LogonViewController alloc] init];

    [self presentViewController:logon animated:YES completion:nil];
}



@end






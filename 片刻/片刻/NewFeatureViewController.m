//
//  NewFeatureViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/13.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "Masonry.h"
#import "RESideMenu.h"
#import "HomeViewController.h"
#import "LeftViewController.h"
@interface NewFeatureViewController ()

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(weakSelf);
    UIImageView* backImage = [[UIImageView alloc] init];
    [self.view addSubview:backImage];

    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.top.equalTo(weakSelf.view.mas_top).offset(60);
        make.size.equalTo(CGSizeMake(80, 80));
    }];
    
    NSMutableArray* imageArray = [[NSMutableArray alloc] init];
    for (int i=0; i<29; i++) {
        NSString* str = [NSString stringWithFormat:@"refresh%d",i];
        UIImage* image = [UIImage imageNamed:str];
        [imageArray addObject:image];
    }
    
    
    [backImage setAnimationImages:imageArray];
    [backImage setAnimationDuration:5];
    [backImage setAnimationRepeatCount:1];
    [backImage startAnimating];
    
    
    //延迟执行语句GCD
     [self performSelector:@selector(runLo) withObject:nil afterDelay:5.0];

    
}

- (void)runLo{
    
    
    HomeViewController* home = [[HomeViewController alloc]init];
    
    LeftViewController* left = [[LeftViewController alloc] init];
    RESideMenu* menu = [[RESideMenu alloc] initWithContentViewController:home leftMenuViewController:left rightMenuViewController:nil];

    menu.panFromEdge = NO;
    //    menu.menuPreferredStatusBarStyle = UIStatusBarStyleBlackTranslucent;
    //菜单动画
    menu.scaleMenuView = NO;
    //内容视图的影子
    menu.contentViewShadowEnabled = NO;
    
    menu.contentViewScaleValue = 1;
    //偏移量
    menu.contentViewInPortraitOffsetCenterX = VIEW_WIDTH/2-45;
    

    self.view.window.rootViewController = menu;

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

@end

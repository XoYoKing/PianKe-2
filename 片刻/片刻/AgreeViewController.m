
//
//  AgreeViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "AgreeViewController.h"
#import "Masonry.h"
@interface AgreeViewController ()

@end

@implementation AgreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIView* viewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, 0.5)];
    [viewOne setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:viewOne];
    
    UIView* viewTwo = [[UIView alloc] initWithFrame:CGRectMake(45, 20, 0.5, 45)];
    [viewTwo setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:viewTwo];

    //返回按钮
    UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    backBtn.contentMode = UIViewContentModeCenter;
    [backBtn addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setFrame:CGRectMake(10, 35, 25, 25)];
    [self.view addSubview:backBtn];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(55, 30, 80, 35)];
    label.contentMode = UIViewContentModeCenter;
    label.text = @"片刻协议";
    [self.view addSubview:label];
    /*

    UITextView* texeView = [[UITextView alloc]init];
    texeView.delegate = self;
    texeView.font = [UIFont systemFontOfSize:13.0];
    texeView.editable = NO;
    
    [self.view addSubview:texeView];
    WS(weakSelf);
    
    [texeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.top.equalTo(weakSelf.view.mas_top).offset(66);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        
     }];           */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnAction:(UIButton*)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

//
//  LogonViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "LogonViewController.h"
#import "ThirdLogonView.h"
#import "SecondLogonView.h"
#import "Masonry.h"
#import "RegisterViewController.h"
@interface LogonViewController ()<UITextFieldDelegate>

@property (strong,nonatomic) ThirdLogonView* thirdView;
@property (strong,nonatomic) SecondLogonView* secondView;
@property (strong, nonatomic) RegisterViewController *registerVC;

@end

@implementation LogonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //返回按钮
    UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    backBtn.contentMode = UIViewContentModeCenter;
    [backBtn addTarget:self action:@selector(returnViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    //注册按钮
    UIButton* setAccount = [UIButton buttonWithType:UIButtonTypeCustom];
    [setAccount setTitle:@"注册" forState:UIControlStateNormal];
    [setAccount setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    setAccount.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [setAccount addTarget:self action:@selector(registerAccount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setAccount];
    
    //片刻logo
    UIImageView* imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"片刻LOGO"];
    imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView];
    
    
    //第二部分色view
    SecondLogonView* secondView = [[SecondLogonView alloc] init];
    self.secondView = secondView;

    self.secondView.textTwo.delegate = self;
    self.secondView.textOne.delegate = self;
    [self.secondView.logon addTarget:self action:@selector(logonBtn:) forControlEvents:UIControlEventTouchUpInside];
    //第三部分view
    ThirdLogonView* thirdView = [[ThirdLogonView alloc] init];
    [self.view addSubview:thirdView];
    self.thirdView = thirdView;
    

    [self.view addSubview:secondView];
    
    //约束
    WS(weakSelf);
    
    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(105);
        
    }];
    
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(thirdView.mas_top).offset(-50);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(170);

    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(120);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(60);
    }];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [setAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回按钮事件

- (void)returnViewController:(UIButton*)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//注册按钮事件
- (void)registerAccount:(UIButton*)sender{
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];

    //模态视图动画设置
    /*typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
     UIModalTransitionStyleCoverVertical = 0,
     UIModalTransitionStyleFlipHorizontal __TVOS_PROHIBITED,
     UIModalTransitionStyleCrossDissolve,
     UIModalTransitionStylePartialCurl NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     };
*/
//    registerVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;

    
    
    
    [self presentViewController:registerVC animated:YES completion:nil];
}
//点击输入框回调事件
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    if (textField == _secondView.textOne) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.view.bounds;
            rect.origin.y = 50;
            self.view.bounds = rect;
        }];
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.view.bounds;
            rect.origin.y = 100;
            self.view.bounds = rect;
        }];
        
        
    }
    
    
    return YES;

    
}
//点击键盘返回键触发事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_secondView.textOne resignFirstResponder];
    [_secondView.textTwo resignFirstResponder];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = 0;
        self.view.bounds = rect;
    }];
    return YES;

}



//触摸屏幕
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_secondView.textOne resignFirstResponder];
    [_secondView.textTwo resignFirstResponder];

    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = 0;
        self.view.bounds = rect;
    }];
}

/*
 auth
 client	1
 deviceid	A55AF7DB-88C8-408D-B983-D0B9C9CA0B36
 email	424267351@qq.com
 passwd	123
 version	3.0.6
 
 */
//登录点击事件
- (void)logonBtn:(UIButton*)sender{
    NSDictionary* dic = @{@"auth":@"",
                          @"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":self.secondView.textOne.text,
                          @"passwd":self.secondView.textTwo.text,
                          @"version":@"3.0.6"};
    WS(weakSelf);
    
    [self POSTHttpRequest:@"http://api2.pianke.me/user/login" dic:dic successBalck:^(id JSON) {
        
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            [weakSelf.view makeToast:@"登录成功！" duration:1 position:@"center"];
            
        }else{
            [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            
        }
        
    } errorBlock:^(NSError *error) {
        
        [weakSelf.view makeToast:@"登录失败" duration:1 position:@"center"];
        
    }];
}
@end











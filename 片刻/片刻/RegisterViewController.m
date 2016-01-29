//
//  RegisterViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RegisterViewController.h"
#import "Masonry.h"
#import "FirstView.h"
#import "AgreeViewController.h"
#import "JPRefreshView.h"
@interface RegisterViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic) FirstView* firstView;
@property (copy, nonatomic)             NSString *imageFiled;
@property (strong,nonatomic) UIButton* imageBtn;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //textfiel代理
    self.firstView.textOne.delegate = self;
    self.firstView.textTwo.delegate = self;
    self.firstView.textThree.delegate = self;

    
    //返回按钮
    UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    backBtn.contentMode = UIViewContentModeCenter;
    [backBtn addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    WS(weakSelf);
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    //头像
    UIButton* HeadImageUpload = [UIButton buttonWithType:UIButtonTypeCustom];
    [HeadImageUpload setImage:[UIImage imageNamed:@"上传头像"] forState:UIControlStateNormal];
    [HeadImageUpload addTarget:self action:@selector(uploadeHeadImage:) forControlEvents:UIControlEventTouchUpInside];
    HeadImageUpload.layer.cornerRadius = 30;
    HeadImageUpload.layer.masksToBounds = YES;
    [self.view addSubview:HeadImageUpload];
    self.imageBtn = HeadImageUpload;
    
    [HeadImageUpload mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(70);
        make.size.equalTo(CGSizeMake(60, 60));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
    }];
    
    //下面注册部分
    [self.view addSubview:self.firstView];

    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(250);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-100);
    }];
   
    //协议
    
    UILabel* labelDelegate = [[UILabel alloc] init];
    [labelDelegate setText:@"点击“完成”按钮代表你已阅读并同意"];
    labelDelegate.contentMode = UIViewContentModeLeft;
    labelDelegate.font = [UIFont systemFontOfSize:11.0];
    [self.view addSubview:labelDelegate];
    
    UIButton* pkDelagate = [UIButton  buttonWithType:UIButtonTypeCustom];
    [pkDelagate setTitle:@"片刻协议" forState:UIControlStateNormal];
    pkDelagate.titleLabel.font = [UIFont systemFontOfSize:11.0];
    [pkDelagate setTitleColor:RGB(119, 182, 69) forState:UIControlStateNormal];
    pkDelagate.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [pkDelagate addTarget:self action:@selector(pkBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pkDelagate];
    
    [labelDelegate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(40);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-40);
        make.size.equalTo(CGSizeMake(200, 20));
    }];
    
    [pkDelagate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-40);
        make.centerY.equalTo(labelDelegate.mas_centerY);
        make.size.equalTo(CGSizeMake(60, 20));
        
    }];
    
    
}

- (void)returnAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


- (FirstView *)firstView{
    if (!_firstView) {
        _firstView = [[FirstView alloc] init];
        [_firstView.registerBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _firstView;
}


- (void)pkBtnPress:(UIButton*)sender{
    
    [self presentViewController:[[AgreeViewController alloc] init] animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark-键盘上弹
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == _firstView.textOne) {
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = 0;
        self.view.bounds = rect;
        
    }];

    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = 0;
        self.view.bounds = rect;
    }];

    
}


#pragma mark - 调用相机相册
//alert
- (void)uploadeHeadImage:(UIButton*)sender{


    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = 0;
        self.view.bounds = rect;
    }];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self imageFromCamera];
        
    }];
    
    UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self imageFromPicture];
        
    }];

    UIAlertAction* action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];

    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];



}

//从相册选择

- (void)imageFromPicture{
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];

    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

//从相机选择
- (void)imageFromCamera{
    
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}
//UIImagePickerController的代理方法，选择好照片后会调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //获得图片
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //获取沙盒目录
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSLog(@"------------%@",homePath);
    //将图片名字拼接到路径后面
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    //将图片写入沙盒
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    //将图片路径保存下来，因为在上传图片的时候会用到
    self.imageFiled = imageViews;
    //更新imageBtn的图片
    [self.imageBtn setImage:editedImage forState:(UIControlStateNormal)];
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)loginHttpRequest{
    //点击完成的时候隐藏键盘
    [self disMissKeyboard];
    //判断用户名是否为空，isEmptyString方法是NSString + helper中的
    if ([_firstView.textOne.text isEmptyString]) {
        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
    }
    //判断密码是否为空，isEmptyString方法是NSString + helper中的
    else if ([_firstView.textThree.text isEmptyString]){
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }
    //判断邮箱是否为空，isEmptyString方法是NSString + helper中的
    else if ([_firstView.textTwo.text isEmptyString]){
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }
    //判断头像是否为空，isEmptyString方法是NSString + helper中的
    else if ([_imageBtn.currentImage isEqual:[UIImage imageNamed:@"上传头像"]]){
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }
    else{
        //开始进行网络请求，上传头像到服务器
        WS(weakSelf);
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self makeLoginRequestDic] image:_imageFiled success:^(id JSON) {
            //等待放动画
//            [JPRefreshView showJPRefreshFromView:weakSelf.view];
            NSDictionary *returnDic = JSON;
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if ([returnDic[@"result"] integerValue] == 1) {
                //成功后的提示框，方法在 UIView+Toast 中，第一个参数是提示的内容，第二个是显示时间，第三个是显示位置，一共有三个
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
            }else{
                [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            }
            
        } failure:^(NSError *error) {
            [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
            NSLog(@"%@",error);
        }];
    }
}
//制作请求参数
- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_firstView.textTwo.text,
                          @"gender":@"1",
                          @"passwd":_firstView.textThree.text,
                          @"uname":_firstView.textOne.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageFiled};
    return dic;
}

//隐藏键盘的方法
- (void)disMissKeyboard{
    [_firstView.textTwo resignFirstResponder];
    [_firstView.textOne resignFirstResponder];
    [_firstView.textThree resignFirstResponder];
}


@end
















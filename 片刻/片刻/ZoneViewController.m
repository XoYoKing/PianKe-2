//
//  ZoneViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ZoneViewController.h"
#define MINDISTANCE 40  // 最小位移
#define MAXSEEK  20

@interface ZoneViewController ()
@property (assign,nonatomic) CGPoint startPoint;
@property (assign,nonatomic) CGPoint endPoint;

@end

@implementation ZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark-手势识别

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [[touches allObjects]lastObject];
    self.startPoint = [touch locationInView:self.view];
    
    NSLog(@"----------------->");
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //记录最终点
    UITouch* touch = [[touches allObjects]lastObject];
    self.endPoint = [touch locationInView:self.view];
    //求偏移量的大小
    CGFloat distance = fabs(self.startPoint.x - self.endPoint.x);
    CGFloat seek = fabs(self.startPoint.y - self.endPoint.y);
    
    
    if (distance > MINDISTANCE && seek < MAXSEEK) {
        NSLog(@"检测到横扫");
        [self appearOrMiss];
    }
    
    
}
- (void)appearOrMiss{
    
    NSLog(@"fuck");
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

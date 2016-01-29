//
//  HomeViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/13.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//
#define MINDISTANCE 40  // 最小位移
#define MAXSEEK  20
#import "HomeViewController.h"
#import "RESideMenu.h"
#import "Masonry.h"
#import "TopView.h"
#import "TabelView.h"

@interface HomeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic) TopView* topView;
@property (strong,nonatomic) UIView* viewOne;
@property (strong,nonatomic) UIView* viewTwo;
@property (strong,nonatomic) UIView* viewThree;
@property (strong,nonatomic) UIScrollView* scrollView;
@property (strong,nonatomic) TabelView* suiPianTable;
@property (assign,nonatomic) CGPoint startPoint;
@property (assign,nonatomic) CGPoint endPoint;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(weakSelf);
    //顶部导航条
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(45);
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
    }];
    
    
        //滚动页面
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT-65)];
    
    [scrollView addSubview:self.viewOne];
    [self.viewOne addSubview:self.suiPianTable];
    self.suiPianTable.scrollEnabled = YES;
    [scrollView addSubview:self.viewTwo];
    [scrollView addSubview:self.viewThree];
    scrollView.scrollEnabled = NO;
    scrollView.contentOffset = CGPointZero;
    scrollView.contentSize = CGSizeMake(VIEW_WIDTH*3, VIEW_HEIGHT-64);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
//    scrollView.userInteractionEnabled = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
//    self.scrollView.userInteractionEnabled = NO;
    self.scrollView.delegate = self;
    
  
}

-(TabelView *)suiPianTable{
    if (!_suiPianTable) {
        _suiPianTable = [[TabelView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64) style:UITableViewStylePlain];
//        _suiPianTable.userInteractionEnabled = YES;
    }
    return _suiPianTable;
}



- (TopView *)topView{
    if (!_topView) {
        _topView = [[TopView alloc] init];
        [_topView setBackgroundColor:[UIColor whiteColor]];
        [_topView.menuBtn addTarget:self action:@selector(menuBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_topView.suiPian addTarget:self action:@selector(suiPianBtnPrtess:) forControlEvents:UIControlEventTouchUpInside];
        _topView.suiPian.selected = YES;
        [_topView.riQi addTarget:self action:@selector(suiPianBtnPrtess:) forControlEvents:UIControlEventTouchUpInside];
        [_topView.dongTai addTarget:self action:@selector(suiPianBtnPrtess:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topView;
}

//菜单按钮点击事件
- (void)menuBtn:(UIButton*)sender{
    [self presentLeftMenuViewController:nil];
}

- (void)suiPianBtnPrtess:(UIButton*)sender{
    sender.selected = YES;
    for (UIButton* btn in [sender.superview subviews]) {
        if ([btn isKindOfClass:[UIButton class]] && btn != sender) {
            btn.selected = NO;
        }
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        CGRect rect = sender.frame;
        CGRect rect2 = self.topView.line.frame;
        rect2.origin.x = rect.origin.x+15;
        
        [self.topView.line setFrame:rect2];
    }];
    
    if ([sender.currentImage isEqual:[UIImage imageNamed:@"nav碎片"]]) {
        self.topView.titleLabel.text = @"碎片";
        
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }];
    }
    if ([sender.currentImage isEqual:[UIImage imageNamed:@"nav旗1"]]) {
        self.topView.titleLabel.text = @"19/Jan.";
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = CGPointMake(VIEW_WIDTH, 0);
        }];
    }
    if ([sender.currentImage isEqual:[UIImage imageNamed:@"nav雷电"]]) {
        self.topView.titleLabel.text = @"动态";
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = CGPointMake(VIEW_WIDTH*2, 0);
        }];
    }
    
}

#pragma mark-scroll方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = self.scrollView.contentOffset.x/VIEW_WIDTH;
    if (index == 0) {
        [self suiPianBtnPrtess:self.topView.suiPian];
        self.topView.titleLabel.text = @"碎片";
        
    }else if(index == 1){
        [self suiPianBtnPrtess:self.topView.riQi];
         self.topView.titleLabel.text = @"19/Jan.";
    }else{
        [self suiPianBtnPrtess:self.topView.dongTai];
        self.topView.titleLabel.text = @"动态";

    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}
- (UIView *)viewOne{
    if (!_viewOne) {
        _viewOne = [[UIView alloc]init];
        [_viewOne setBackgroundColor:[UIColor yellowColor]];
        [_viewOne setFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
//        _viewOne.userInteractionEnabled = NO;
    }
    return _viewOne;
}

- (UIView *)viewTwo{
    if (!_viewTwo) {
        _viewTwo = [[UIView alloc]init];
        [_viewTwo setBackgroundColor:[UIColor orangeColor]];
        [_viewTwo setFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    }
    return _viewTwo;
    
    
}
- (UIView *)viewThree{
    if (!_viewThree) {
        _viewThree = [[UIView alloc]init];
        [_viewThree setBackgroundColor:[UIColor redColor]];
        [_viewThree setFrame:CGRectMake(VIEW_WIDTH*2, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    }
    return _viewThree;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//调节状态栏颜色


//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

@end









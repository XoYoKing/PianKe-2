//
//  ReadingView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ReadingView.h"

@implementation ReadingView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatTopScrollView];
        [self creatNineBtn];
        [self creatFootBtn];
    }
    return self;
}

- (void)creatTopScrollView{
    
    SDCycleScrollView* scrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_WIDTH*(150.0f/320.0f))];
        scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    
}
- (void)creatNineBtn{
    
    CGFloat leng = (VIEW_WIDTH-15)/3;
    CGFloat leng2 = VIEW_WIDTH*(150.0f/320.0f);
    NSLog(@"%lf",leng2);
    
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = 10001+i*3+j;
            [btn setFrame:CGRectMake(5+j*(leng+2.5), leng2+5+i*(leng+2.5), leng, leng)];
            [btn setBackgroundColor:[UIColor redColor]];
            [self addSubview:btn];
            
            UILabel* labelOne = [[UILabel alloc] initWithFrame:CGRectMake(8+j*(leng+2.5), leng2+5+i*(leng+2.5)+80 , leng/3, 15)];
            if ((i==0)&&(j==1||j==0)) {
                
                [labelOne setFrame:CGRectMake(8+j*(leng+2.5), leng2+5+i*(leng+2.5)+80 , leng/3*2, 15)];
                
            }
            labelOne.font = [UIFont systemFontOfSize:15];
            labelOne.textColor = [UIColor whiteColor];
            labelOne.tag = 11001+i*3+j;
            [self addSubview:labelOne];
            
            UILabel* labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(3+j*(leng+2.5)+leng/3, leng2+5+i*(leng+2.5)+82 , leng/3+40, 15)];
            if ((i==0)&&(j==1||j==0)) {
                [labelTwo setFrame:CGRectMake(3+j*(leng+2.5)+leng/3*2, leng2+5+i*(leng+2.5)+82 , leng/3+30, 15)];
            }
            labelTwo.font = [UIFont systemFontOfSize:13];
            labelTwo.textColor = [UIColor whiteColor];
            labelTwo.tag = 12001+i*3+j;
            [self addSubview:labelTwo];
            
        }
    }
    
}
- (void)creatFootBtn{
    CGFloat leng = (VIEW_WIDTH-15)/3;
    CGFloat leng2 = VIEW_WIDTH*(150.0f/320.0f);

    UIButton* footBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footBtn setFrame:CGRectMake(5,leng2+leng*3+12.5,VIEW_WIDTH-10,leng)];
//    [footBtn setBackgroundColor:[UIColor cyanColor]];
    [footBtn setImage:[UIImage imageNamed:@"写作"] forState:UIControlStateNormal];
    [self addSubview:footBtn];
}
@end





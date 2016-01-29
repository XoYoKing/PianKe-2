//
//  ScrollViewTableViewCell.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ScrollViewTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ScrollViewTableViewCell()<UIScrollViewDelegate>
@end

@implementation ScrollViewTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.scrollView];
        self.scrollView.delegate = self;
        [self.contentView addSubview:self.pageControll];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_WIDTH/2)];
        [_scrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
        [_scrollView setContentSize:CGSizeMake(VIEW_WIDTH*5, VIEW_WIDTH/2)];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setBounces:NO];
        [_scrollView setPagingEnabled:YES];
        
    }
    return _scrollView;
}

-(UIPageControl *)pageControll{
    if (!_pageControll) {
        _pageControll = [[UIPageControl alloc]initWithFrame:CGRectMake(VIEW_WIDTH-80, VIEW_WIDTH/2-25, 60, 30)];
        _pageControll.currentPage = 0;
        _pageControll.numberOfPages = 3;
//        _pageControll.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControll.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _pageControll;
}
//通过set方法对控件赋值

-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    
    UIImageView* image0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_WIDTH/2)];
    [image0 sd_setImageWithURL:[NSURL URLWithString:[self.imageArray[2] valueForKey:@"img"]]];
    
    UIImageView* image1 = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_WIDTH/2)];
    [image1 sd_setImageWithURL:[NSURL URLWithString:[self.imageArray[0] valueForKey:@"img"]]];
    
    UIImageView* image2 = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_WIDTH*2, 0, VIEW_WIDTH, VIEW_WIDTH/2)];
    [image2 sd_setImageWithURL:[NSURL URLWithString:[self.imageArray[1] valueForKey:@"img"]]];
    
    UIImageView* image3 = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_WIDTH*3, 0, VIEW_WIDTH, VIEW_WIDTH/2)];
    [image3 sd_setImageWithURL:[NSURL URLWithString:[self.imageArray[2] valueForKey:@"img"]]];
    
    UIImageView* image4 = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_WIDTH*4, 0, VIEW_WIDTH, VIEW_WIDTH/2)];
    [image4 sd_setImageWithURL:[NSURL URLWithString:[self.imageArray[0] valueForKey:@"img"]]];
    [_scrollView addSubview:image0];
    [_scrollView addSubview:image1];
    [_scrollView addSubview:image2];
    [_scrollView addSubview:image3];
    [_scrollView addSubview:image4];
}


#pragma mark-ScrollView

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (self.scrollView.contentOffset.x == VIEW_WIDTH*4) {
        self.scrollView.contentOffset = CGPointMake(VIEW_WIDTH, 0);
    }
    if (self.scrollView.contentOffset.x == 0) {
        self.scrollView.contentOffset = CGPointMake(VIEW_WIDTH*3, 0);
    }
    self.pageControll.currentPage = self.scrollView.contentOffset.x/VIEW_WIDTH-1;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

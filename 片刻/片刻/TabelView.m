//
//  TabelView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TabelView.h"
#import "TableViewCell.h"
#import "BaseViewController.h"
#import "ModelManager.h"
#import "DataModel.h"
#import "MJRefresh.h"
#import "MJDIYHeader.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "UIScrollView+MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@interface TabelView()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSArray* dataArray;
@property (strong,nonatomic) NSArray* imageArray;
@end
@implementation TabelView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
       
        [self registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
         [self POST];
        //添加mj刷新
        [self addRefreshControl];

        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}


//明杰刷新

- (void)addRefreshControl{
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    self.mj_header = header;
    //设置上拉加载的动画
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}



//网络请求
- (void)POST{
    
    NSDictionary* dic = @{@"auth":@"",
                          @"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"limit":@"10",
                          @"start":@"0",
                          @"version":@"3.0.6"};
    
    [[[BaseViewController alloc]init] POSTHttpRequest:@"http://api2.pianke.me/timeline/list" dic:dic successBalck:^(id JSON) {
        
        NSDictionary* dic = JSON;
//        NSLog(@"%@",JSON);
        
       self.dataArray = [ModelManager parserWithData:dic];
//        
        
        self.imageArray = [self countCellHeigh];
        
        NSLog(@"%@",self.imageArray);
        
//        从新刷新数据 加载表格
        
//        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadData];

//        });
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}

//

- (NSArray*)countCellHeigh{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for (int i=0; i<self.dataArray.count; i++) {
        DataModel* model = self.dataArray[i];
        [array addObject:model.coverimg_wh];
    }
    return array;
}
//照片的高度
- (CGFloat)imageHeigh:(NSInteger)row{
    
  NSString* str = self.imageArray[row];
    if ([str isEqualToString:@""]) {
        return 0;
    }else{
    NSArray* arr = [str componentsSeparatedByString:@"*"];
    
        return  ((VIEW_WIDTH-40)/[arr[0] floatValue])*[arr[1] floatValue];}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  DataModel* model = self.dataArray[indexPath.row];
   CGFloat cellHeigh = [NSString autoHeightWithString:model.content Width:VIEW_WIDTH-40 Font:[UIFont systemFontOfSize:13]];
    
//    NSLog(@"%f",40+cellHeigh+20+[self imageHeigh:indexPath.row]);
    return 60+cellHeigh+[self imageHeigh:indexPath.row];
//    return 800;
}
    
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* identifier = @"cell";
    
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    cell.image.image = nil;
    DataModel* model =self.dataArray[indexPath.row];
    
    
    
    cell.userName.text = model.uname;
    cell.detailLabel.text = model.content;
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
    if (![model.coverimg_wh isEqualToString:@""]) {
        
    
        NSString* str = model.coverimg_wh;
            NSArray* arr = [str componentsSeparatedByString:@"*"];
            
           CGFloat heigh = ((VIEW_WIDTH-40)/[arr[0] floatValue])*[arr[1] floatValue];;
            [cell.image setFrame:CGRectMake(20, 45, VIEW_WIDTH-40,heigh)];
     
            [cell.image sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
    } else {
    

        [cell.image setFrame:CGRectMake(20, 45, VIEW_WIDTH-40, 0)];
    
    }

    
        
        
        return cell;
    
}


- (void)loadNewData{
    NSLog(@"------------------------>111111111");
    
}
- (void)loadMoreData{
 
    NSLog(@"-------------------------->22222222222");
}
@end










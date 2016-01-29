//
//  LeftTabelView.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/14.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "LeftTabelView.h"
#import "LeftTableViewCell.h"
#import "CellModel.h"
@interface LeftTabelView()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray* dataArray;


@end


@implementation LeftTabelView

- (NSArray *)dataArray{
    
    if (!_dataArray) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Menu" ofType:@"plist"];
        NSArray* array = [[NSArray alloc] initWithContentsOfFile:filePath];
        NSMutableArray* arr = [[NSMutableArray alloc] init];
        for (NSDictionary* dic in array) {
            CellModel* model = [[CellModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [arr addObject:model];
        }
        _dataArray = arr;
    }
    return _dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
   
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[LeftTableViewCell class] forCellReuseIdentifier:@"cell"];
        
        //隐藏表格线条
        self.separatorStyle = NO;
        
        self.backgroundColor = RGB(51, 51, 51);
    }
    return self;

    
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55;
    
}
//cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cell";
    
    LeftTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    CellModel* model = self.dataArray[indexPath.row];
    
    cell.imageMenu.image = [UIImage imageNamed:model.imageName];
    cell.labelMenu.text = model.labelText;
    
    
    return cell;
}
//表格点击事件

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self changePage:indexPath];


}
//通知设置
- (void)changePage:(NSIndexPath*)indexPath{
    
    
    if ([self.delegateOfRow respondsToSelector:@selector(changePageWithRow:)]) {
        [self.delegateOfRow changePageWithRow:indexPath.row];
    }
    
    
    
    
    
    
   //使用通知方法
//    if (indexPath.row == 0) {
//        NSNotificationCenter* defaultCenter0 = [NSNotificationCenter defaultCenter];
//        [defaultCenter0 postNotificationName:@"首页" object:nil];
//        }
//    
//    if (indexPath.row == 1) {
//        NSNotificationCenter* defaultCenter1 = [NSNotificationCenter defaultCenter];
//        [defaultCenter1 postNotificationName:@"电台" object:nil];
//    }
//
//    if (indexPath.row == 2) {
//        NSNotificationCenter* defaultCenter2 = [NSNotificationCenter defaultCenter];
//        [defaultCenter2 postNotificationName:@"阅读" object:nil];
//    }
//
//    if (indexPath.row == 3) {
//        NSNotificationCenter* defaultCenter3 = [NSNotificationCenter defaultCenter];
//        [defaultCenter3 postNotificationName:@"社区" object:nil];
//    }
//
//    if (indexPath.row == 4) {
//        NSNotificationCenter* defaultCenter4 = [NSNotificationCenter defaultCenter];
//        [defaultCenter4 postNotificationName:@"碎片" object:nil];
//    }
//
//    if (indexPath.row == 5) {
//        NSNotificationCenter* defaultCenter5 = [NSNotificationCenter defaultCenter];
//        [defaultCenter5 postNotificationName:@"良品" object:nil];
//    }
//
//    if (indexPath.row == 6) {
//        NSNotificationCenter* defaultCenter6 = [NSNotificationCenter defaultCenter];
//        [defaultCenter6 postNotificationName:@"设置" object:nil];
//    }

    
}



@end








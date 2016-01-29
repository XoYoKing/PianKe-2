//
//  TabelView.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellDelegate <NSObject>

- (void)giveCellHeigh:(NSInteger)row;



@end

@interface TabelView : UITableView

@property (weak,nonatomic) id<CellDelegate> heighDelegate;

@end

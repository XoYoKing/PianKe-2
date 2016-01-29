//
//  LeftTabelView.h
//  片刻
//
//  Created by Mr.Jiang on 16/1/14.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftTabelViewSelectRow <NSObject>

- (void)changePageWithRow:(NSInteger)row;

@end

@interface LeftTabelView : UITableView

@property (weak,nonatomic) id <LeftTabelViewSelectRow> delegateOfRow;

@end

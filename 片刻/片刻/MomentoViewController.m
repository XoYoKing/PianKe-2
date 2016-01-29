//
//  MomentoViewController.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "MomentoViewController.h"
#import "TabelView.h"
@interface MomentoViewController ()

@property (strong,nonatomic) TabelView* suiPianTable;
@end

@implementation MomentoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.suiPianTable];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark- 表格
- (TabelView *)suiPianTable{
    if (!_suiPianTable) {
        _suiPianTable = [[TabelView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64) style:UITableViewStylePlain];
    }
    return _suiPianTable;
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

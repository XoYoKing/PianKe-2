//
//  ModelManager.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/20.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ModelManager.h"
#import "DataModel.h"
@implementation ModelManager

+ (NSArray*)parserWithData:(NSDictionary*)data{
    
    // 解析数据
    
    NSDictionary* tempDic = data[@"data"];
    NSArray* newsArr = tempDic[@"list"];
    
    
    
    NSMutableArray* modelArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary* smallDataDic in newsArr) {
        
        NSDictionary* newsDicOne = smallDataDic[@"userinfo"];
//        NSDictionary* newsDicTwo = smallDataDic[@"counterList"];
        

        
        NSDictionary* dic = @{@"content":smallDataDic[@"content"],@"icon":newsDicOne[@"icon"],@"uname":newsDicOne[@"uname"],@"coverimg_wh":smallDataDic[@"coverimg_wh"],@"coverimg":smallDataDic[@"coverimg"]};
        DataModel* model = [[DataModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [modelArray addObject:model];
    }
    
    return modelArray;

    
    
}


@end











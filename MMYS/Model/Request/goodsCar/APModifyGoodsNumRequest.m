//
//  APModifyGoodsNumRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/11.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APModifyGoodsNumRequest.h"

@implementation APModifyGoodsNumRequest

- (id)initWithPurchaseCarUUID:(NSString *)purchase_car_uuid andNumber:(NSInteger)num
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (purchase_car_uuid) {
            
            [bodyDict setObject:purchase_car_uuid forKey:@"purchase_car_uuid"];
        }
        
        if (num) {
            [bodyDict setObject:@(num) forKey:@"number"];
        }
        
        NSMutableDictionary     *paramsDict = [self params];
        [paramsDict setObject:bodyDict forKey:@"body"];
    }
    
    return self;
}

- (BOOL)isPost
{
    return YES;
}

- (NSString *)methodPath
{
    return @"car/update";//修改商品数量
}

@end

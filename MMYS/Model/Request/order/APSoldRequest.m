//
//  APSoldRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APSoldRequest.h"

@implementation APSoldRequest

- (id)initWithGoodsOrderUUID:(NSString *)orderUUID andGoodsCarUUID:(NSString *)goodsCarUUID andNumber:(NSInteger)num
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (orderUUID) {
            [bodyDict setObject:orderUUID forKey:@"order_uuid"];
        }
        if (goodsCarUUID) {
            [bodyDict setObject:goodsCarUUID forKey:@"purchase_car_uuid"];
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

- (NSString *)methodPath//标记售出
{
    return @"order/sign";
}

@end

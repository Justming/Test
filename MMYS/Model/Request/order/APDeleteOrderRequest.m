//
//  APDeleteOrderRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APDeleteOrderRequest.h"

@implementation APDeleteOrderRequest

- (id)initWithGoodsOrderUUID:(NSString *)orderUUID
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (orderUUID) {
             [bodyDict setObject:orderUUID forKey:@"order_uuid"];
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

- (NSString *)methodPath//删除订单
{
    return @"order/delete";
}


@end

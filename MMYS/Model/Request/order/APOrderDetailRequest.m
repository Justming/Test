//
//  APOrderDetailRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APOrderDetailRequest.h"

@implementation APOrderDetailRequest

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

- (NSString *)methodPath//订单详情
{
    return @"order/show";
}

@end
